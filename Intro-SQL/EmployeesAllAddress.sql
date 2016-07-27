SELECT e.FirstName,e.LastName, a.AddressText,t.Name as Town
FROM Employees e ,Addresses a ,Towns t
WHERE e.AddressID = a.AddressID and a.TownID = t.TownID