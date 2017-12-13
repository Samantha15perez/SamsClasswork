use library
go

CREATE TRIGGER trgModifieddateRemoved
on dbo.removed
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
update dbo.Removed
set modifieddate = getdate(), modifiedby = original_login()
print 'table updated'
END
GO



CREATE TRIGGER trgModifieddatevolunteers
on dbo.volunteers
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
update dbo.volunteers
set modifieddate = getdate(), modifiedby = original_login()
print 'table updated'
END
GO


CREATE TRIGGER trgModifieddateEmployees
on dbo.employees
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
update dbo.employees
set modifieddate = getdate(), modifiedby = original_login()
print 'table updated'
END
GO



