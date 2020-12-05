B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.5
@EndOfDesignText@
Sub Class_Globals
	Private co As BANanoObject
	Private cName As String
	Private banano As BANano
End Sub

Public Sub Initialize(db As BANanoObject, colName As String) As LBaseCollection
	cName = colName
	co = db.RunMethod("collection", Array(colName))
	Return Me
End Sub

'add a record
Sub Add(record As Map) As BANanoPromise
	Dim p As BANanoPromise = co.RunMethod("add", Array(record))
	Return p
End Sub

'add a record using key
Sub AddWithKey(key As String, record As Map) As BANanoPromise
	Dim p As BANanoPromise = co.RunMethod("add", Array(record, key))
	Return p
End Sub

'get records
Sub Get() As BANanoPromise
	Dim promAdd As BANanoPromise = co.RunMethod("get", Null)
	Return promAdd
End Sub

'get records with keys
Sub GetWithKey() As BANanoPromise
	Dim k As Map = CreateMap()
	k.Put("keys", True)
	Dim promAdd As BANanoPromise = co.RunMethod("get", Array(k))
	Return promAdd
End Sub


'get doc
Sub Doc(pk As String, pv As String) As LBaseDocument
	Dim docx As LBaseDocument
	docx.Initialize(co, pk, pv)
	Return docx
End Sub

'get doc with key
Sub DocWithKey(key As String) As LBaseDocument
	Dim docx As LBaseDocument
	docx.Initialize(co, key, "")
	Return docx
End Sub


'set will overwrite all records
Sub Set(records As List) As BANanoPromise
	Dim p As BANanoPromise = co.RunMethod("set", Array(records))
	Return p
End Sub


'set will overwrite all records including keys
Sub SetWithKeys(records As List) As BANanoPromise
	Dim k As Map = CreateMap()
	k.Put("keys", True)
	Dim p As BANanoPromise = co.RunMethod("set", Array(records, k))
	Return p
End Sub


'set orderby on bananoobject
Sub OrderBy(fld As String, orderType As String) As LBaseCollection
	co.RunMethod("orderBy", Array(fld, orderType))
	Return Me
End Sub

'set limit
Sub Limit(iLimit As Int) As LBaseCollection
	co.RunMethod("limit", Array(iLimit))
	Return Me
End Sub


'delete the collection
Sub Delete() As BANanoPromise
	Dim p As BANanoPromise = co.RunMethod("delete", Null)
	Return p
End Sub
