pragrma Singleton

import Quickshell.Io
import QtQuick
import qs

Singleton {
  id: networkService
  property commandsBasePath: "services/network_services/"
  property var scanCommand: Static.getPath(commandsBasePath + "scan.sh")

  property var networksList: []

  signal scanCompleted(networksList)

  Process { id: networkProcess }

  function getAvailableNetworks() {
    const command = prepareCommand(scanCommand);
    const t = networkService.networkProcess.exec(command);
  }


  function prepareCommand(command) {
    return [
      "sh",
      "-c",
      command
    ]
  }
}
