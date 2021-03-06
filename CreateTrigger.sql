CREATE TRIGGER [Trigger_Name] ON [Existing_Table_Name]
AFTER INSERT , UPDATE , DELETE
AS
     BEGIN
         DECLARE @operation CHAR(6);
         SET @operation = CASE
                              WHEN EXISTS ( SELECT *
                                            FROM inserted
                                          )
                                   AND 
                                   EXISTS ( SELECT *
                                            FROM deleted
                                          )
                              THEN 'Update'
                              WHEN EXISTS ( SELECT *
                                            FROM inserted
                                          )
                              THEN 'Insert'
                              WHEN EXISTS ( SELECT *
                                            FROM deleted
                                          )
                              THEN 'Delete'
                              ELSE NULL
                          END;
         IF @operation = 'Delete'
             BEGIN
                 INSERT INTO [Schema_Name].[Table_Name] ( Command , ChangeDate , UserName , HostName , SampleColumn 
                                                        ) 
                        SELECT @operation , GETDATE() , USER_NAME() , HOST_NAME() , SampleColumn  
                        FROM deleted AS d;
         END;
         IF @operation = 'Insert'
             BEGIN
                 INSERT INTO [Schema_Name].[Table_Name] ( Command , ChangeDate , UserName , HostName , SampleColumn 
                                                        ) 
                        SELECT @operation , GETDATE() , USER_NAME() , HOST_NAME() , SampleColumn 
                        FROM inserted AS i;
         END;
         IF @operation = 'Update'
             BEGIN
                 INSERT INTO [Schema_Name].[Table_Name] ( Command , ChangeDate , UserName , HostName , SampleColumn  
                                                        ) 
                        SELECT @operation , GETDATE() , USER_NAME() , HOST_NAME() , SampleColumn  
                        FROM deleted AS d
         END;
     END;
GO
