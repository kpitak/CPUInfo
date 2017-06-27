import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 500
    height: 400
    MainForm {
        id: mainForm
        anchors.fill: parent
        readFile.onClicked: {
            comboboxModel.clear()
            cpuInfoData.ReadCPUInfoData();
            comboBox1.currentIndex = 0;
        }

        comboBox1.onActivated: {
            cpuInfoData.getData(index);
        }
        comboBox1.model:comboboxModel

        ListModel{
            id: comboboxModel
        }
        Connections{
            target: cpuInfoData
            onDisplayDataChanged:{
                mainForm.processor = processor;
                mainForm.vendorId = vendor;
                mainForm.modelName = modelName;
                mainForm.cpuMhz = cpu_MHz;
                mainForm.cacheSize = cache_Size;
                mainForm.cpuCores = cpu_Cores;
            }

        }
        Connections{
            target: cpuInfoData
            onNoOfCPUAvailable:{
                if(count !== 0)
                {
                    for(var i=0;i<=count;i++)
                    {
                        if(i==0)
                        {
                            comboboxModel.append({text:"---"})
                        }
                        else
                        {

                            comboboxModel.append({text: (i-1).toString()})
                        }
                    }
                }

            }
        }
    }
}

