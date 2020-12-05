B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.5
@EndOfDesignText@
Sub Class_Globals
	Private doc As BANanoObject
End Sub

Public Sub Initialize(co As BANanoObject, pk As String, pv As String) As LBaseDocument
	If pk <> "" And pv <> "" Then
		'get using doc property
		Dim rec As Map = CreateMap()
		rec.Put(pk, pv)
		doc = co.RunMethod("doc", Array(rec))
	Else
		'get using key
		doc = co.RunMethod("doc", Array(pk))
	End If
	Return Me
End Sub

'update the record
Sub Update(record As Map) As BANanoPromise
	Dim p As BANanoPromise = doc.RunMethod("update", Array(record))
	Return p
End Sub

'set will overwrite everything
Sub Set(record As Map) As BANanoPromise
	Dim p As BANanoPromise = doc.RunMethod("set", Array(record))
	Return p
End Sub

'get a record
Sub Get() As BANanoPromise
	Dim promAdd As BANanoPromise = doc.RunMethod("get", Null)
	Return promAdd
End Sub

'delete a record
Sub Delete() As BANanoPromise
	Dim p As BANanoPromise = doc.RunMethod("delete", Null)
	Return p
End Sub
