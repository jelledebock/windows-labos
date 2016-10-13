#Queries WQL

#18.

select * from CIM_LogicalDisk
select * from Win32_OperatingSystem

#19.

select * from Win32_DiskPartition

select * from CIM_StorageExtent
where __CLASS <> "Win32_DiskPartition"

#20.

select * from Win32_Directory
where __RELPATH = "Win32_Directory.Name=\"C:\\\\\""


#21.

select * from Win32_NTLogEvent
where EventCode = 6005 or EventCode = 6006

#22.
select * from Win32_Process
where WriteOperationCount > ReadOperationCount and ThreadCount > 10
or VirtualSize>10000 

#23.
--Kan je niet oplossen met WQL

#24.
--a.
select * from meta_class where __CLASS="CIM_Service"

--b.
select * from meta_class where __SUPERCLASS="CIM_Service"

--c
select * from meta_class where __SUPERCLASS=""

#25.
select * from meta_class where __THIS ISA "CIM_Service"
and __CLASS <> "CIM_Service"

#26.
ASSOCIATORS OF{\\KANDINSKY\root\CIMV2:Win32_Directory.Name="c:\\"}

#27.
ASSOCIATORS OF{\\KANDINSKY\root\CIMV2:Win32_Directory.Name="c:\\"}
where ClassDefsOnly

#28.
