CREATE TABLE [Schema_Name].[Table_Name] ( 
             Id                      INT PRIMARY KEY IDENTITY(1 , 1) NOT NULL , 
             ChangeDate              DATETIME DEFAULT GETDATE() NOT NULL , 
             Command                 NCHAR(6) NOT NULL , 
             UserName                NCHAR(100) NOT NULL , 
             HostName                VARCHAR(100) NOT NULL , 
             SampleColumn            VARCHAR(100) NOT NULL 
			
          
                                        );
GO