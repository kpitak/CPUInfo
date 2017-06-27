#include "cpuinfo.h"

CPUData CPUInfo::CPUDataItem;

CPUInfo::CPUInfo()
{

}

void CPUInfo::ReadCPUInfoData()
{
    QFile file("/proc/cpuinfo");
    CPUDataList.clear();
    emit noOfCPUAvailable(0);
    emit displayDataChanged("--","--","--","--","--","--");
    if(!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        return;
    }
    QTextStream input(&file);
    QString line = input.readLine();
    while(!line.isNull())
    {
        ProcessLine(line);
        line = input.readLine();
    }
    emit noOfCPUAvailable(CPUDataList.size());
}

void CPUInfo::getData(int index)
{
    if(index>0 && index <= CPUDataList.size())
    {
        CPUData data = CPUDataList.at(index-1);
        emit displayDataChanged(data.Processor, data.VendorId, data.ModelName,data.CPUMHz,data.CacheSize,data.CPUCores);
    }
}

void CPUInfo::ProcessLine(QString line)
{
    QString strippedString = line;
    strippedString.remove(QRegExp("((((?:[a-z][]*[A-Z0-9 _]*)))+(\t)+([: ])+)|((((?:[a-z][]*[A-Z0-9 _]*)))+([: ])+)"));

    if(line.contains("processor"))
    {
        CPUDataItem.Processor = strippedString;
    }
    else if(line.contains("cpu MHz"))
    {
        CPUDataItem.CPUMHz = strippedString;
    }
    else if(line.contains("vendor_id"))
    {
        CPUDataItem.VendorId = strippedString;
    }
    else if(line.contains("model name"))
    {
        CPUDataItem.ModelName = strippedString;
    }
    else if(line.contains("cache size"))
    {
        CPUDataItem.CacheSize = strippedString;
    }
    else if(line.contains("cpu cores"))
    {
        CPUDataItem.CPUCores = strippedString;
        CPUDataList.append(CPUDataItem);
    }
}

