Queries WQL

18.

select * from CIM_LogicalDisk
select * from Win32_OperatingSystem

19.

select * from Win32_DiskPartition

select * from CIM_StorageExtent
where __CLASS <> "Win32_DiskPartition"

20.