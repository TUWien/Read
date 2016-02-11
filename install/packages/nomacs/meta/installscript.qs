/**************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Installer Framework.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** As a special exception, The Qt Company gives you certain additional
** rights. These rights are described in The Qt Company LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
**
** $QT_END_LICENSE$
**
**************************************************************************/

function Component()
{
	console.log("v 10.02 --------------------------------");
	installer.installationFinished.connect(this, Component.prototype.installationFinishedPageIsShown);
    installer.finishButtonClicked.connect(this, Component.prototype.installationFinished);
	
    console.log("OS: " + systemInfo.productType);
    console.log("Kernel: " + systemInfo.kernelType + "/" + systemInfo.kernelVersion);
	console.log("CPU: " + systemInfo.currentCpuArchitecture);
		
    installer.componentByName("nomacs.x64").setValue("Default", "true");
		
	// hide ready for installation page:
	installer.setDefaultPageVisible(QInstaller.ReadyForInstallation, false);
	installer.setDefaultPageVisible(QInstaller.LicenseCheck, false);
}

Component.prototype.isDefault = function()
{
    // select the component by default
    return true;
}

Component.prototype.createOperations = function()
{
    try {
        // call the base create operations function
        component.createOperations();
	
		var bitness = new Array();
	
		if (!installer.isUpdater()) { // new installer
			// diem 05.01.2016 - installationRequested() is always true in the updater?!
			if (installer.componentByName("nomacs.x64").installationRequested()) {
				bitness.push("x64");
				console.log("x64 installation requested...");
			}
		}
		else {	// updater
			if (installer.componentByName("nomacs.x64").isInstalled()) {
				bitness.push("x64");
				console.log("x64 is installed...");
			}			
		}

		for (idx = 0; idx < bitness.length; idx++) {
			component.addOperation("CreateShortcut", "@TargetDir@/nomacs-" + bitness[idx] + "/nomacs.exe",   "@StartMenuDir@/READ Framework [" + bitness[idx] + "].lnk", "workingDirectory=@TargetDir@");
			component.addOperation("CreateShortcut", "@TargetDir@/nomacs-" + bitness[idx] + "/nomacs.exe",   "@TargetDir@/READ Framework [" + bitness[idx] + "].exe.lnk", "workingDirectory=@TargetDir@");
		}

	} catch (e) {
        console.log(e);
    }

}

Component.prototype.installationFinishedPageIsShown = function() {
    try {
        if (installer.isInstaller() && installer.status == QInstaller.Success) {
            installer.addWizardPageItem(component, "OpenAppCheckBoxForm", QInstaller.InstallationFinished);
        }
    } catch(e) {
        console.log(e);
    }
}

Component.prototype.installationFinished = function() {
    try {
        if (installer.isInstaller() && installer.status == QInstaller.Success) {

			// open nomacs
			var isOpenAppCheckBoxChecked = component.userInterface("OpenAppCheckBoxForm").openAppCheckBox.checked;
            if (isOpenAppCheckBoxChecked) {
				
				if (installer.componentByName("nomacs.x64").installationRequested())
					QDesktopServices.openUrl("file:///" + installer.value("TargetDir") + "/nomacs-x64/nomacs.exe");
			}
        }
    } catch(e) {
        console.log(e);
    }
}
