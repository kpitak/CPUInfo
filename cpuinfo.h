#ifndef CPUINFO_H
#define CPUINFO_H

#include <QQuickItem>

typedef struct
{
    QString Processor;
    QString VendorId;
    QString ModelName;
    QString CPUMHz;
    QString CacheSize;
    QString CPUCores;
} CPUData;

class CPUInfo :public QQuickItem
{
    Q_OBJECT
public:
    CPUInfo();
    ~CPUInfo(){}
    Q_INVOKABLE void ReadCPUInfoData();
    Q_INVOKABLE void getData(int index);

signals:
    void displayDataChanged(QString processor, QString vendor, QString modelName, QString cpu_MHz, QString cache_Size, QString cpu_Cores);
    void noOfCPUAvailable(int count);

private:
    void ProcessLine(QString line);
    QList<CPUData> CPUDataList;
    static CPUData CPUDataItem;
};

#endif // CPUINFO_H
