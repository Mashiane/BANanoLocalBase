B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.5
@EndOfDesignText@
Sub Class_Globals
	Private db As BANanoObject
	Private banano As BANano
	Public const LB_ASC As String = "asc"
	Public const LB_DESC As String = "desc"
End Sub

'source: https://github.com/dannyconnell/localbase

'*initialize the class and open the database
Public Sub Initialize(dbName As String) As BANanoLocalBase
	banano.DependsOnAsset("localbase.min.js")
	'open the connection
	db.Initialize2("Localbase", Array(dbName))
	'we use own system own keys
	Return Me
End Sub

'*get a collection
Sub Collection(colName As String) As LBaseCollection
	Dim lbc As LBaseCollection
	lbc.Initialize(db, colName)
	Return lbc
End Sub


'delete the database
Sub Delete() As BANanoPromise
	Dim p As BANanoPromise = db.RunMethod("delete", Null)
	Return p
End Sub

