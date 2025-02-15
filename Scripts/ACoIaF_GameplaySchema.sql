

ALTER TABLE Governments	ADD "PrereqTech" TEXT;	
			
						
						
CREATE TABLE "ExcludedUnits" (
		"UnitType" TEXT NOT NULL,
		"TraitType" TEXT NOT NULL,
		PRIMARY KEY(UnitType, TraitType),
		FOREIGN KEY (UnitType) REFERENCES Units(UnitType) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (TraitType) REFERENCES Traits(TraitType) ON DELETE CASCADE ON UPDATE CASCADE);
		

CREATE TABLE "ExcludedBuildings" (
		"BuildingType" TEXT NOT NULL,
		"TraitType" TEXT NOT NULL,
		PRIMARY KEY(BuildingType, TraitType),
		FOREIGN KEY (BuildingType) REFERENCES Buildings(BuildingType) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (TraitType) REFERENCES Traits(TraitType) ON DELETE CASCADE ON UPDATE CASCADE);

		
INSERT INTO NavigationProperties("BaseTable", "PropertyName", "TargetTable", "IsCollection", "Query") VALUES("Units", "ExclusionReference", "ExcludedUnits", 1,"SELECT T1.rowid from ExcludedUnits as T1 inner join Units as T2 on T2.UnitType = T1.UnitType where T2.rowid = ? ORDER BY T1.rowid ASC");
INSERT INTO NavigationProperties("BaseTable", "PropertyName", "TargetTable", "IsCollection", "Query") VALUES("ExcludedUnits", "TraitReference", "Traits", 0,"SELECT T1.rowid from Traits as T1 inner join ExcludedUnits as T2 on T2.TraitType = T1.TraitType where T2.rowid = ? ORDER BY T1.rowid ASC LIMIT 1");
INSERT INTO NavigationProperties("BaseTable", "PropertyName", "TargetTable", "IsCollection", "Query") VALUES("Buildings", "ExclusionReference", "ExcludedBuildings", 1,"SELECT T1.rowid from ExcludedBuildings as T1 inner join Buildings as T2 on T2.BuildingType = T1.BuildingType where T2.rowid = ? ORDER BY T1.rowid ASC");
INSERT INTO NavigationProperties("BaseTable", "PropertyName", "TargetTable", "IsCollection", "Query") VALUES("ExcludedBuildings", "TraitReference", "Traits", 0,"SELECT T1.rowid from Traits as T1 inner join ExcludedBuildings as T2 on T2.TraitType = T1.TraitType where T2.rowid = ? ORDER BY T1.rowid ASC LIMIT 1");
INSERT INTO NavigationProperties("BaseTable", "PropertyName", "TargetTable", "IsCollection", "Query") VALUES("Governments", "PrereqTechReference", "Technologies", 0,"SELECT T1.rowid from Technologies as T1 inner join Governments as T2 on T2.PrereqTech = T1.TechnologyType where T2.rowid = ? ORDER BY T1.rowid ASC LIMIT 1");

	