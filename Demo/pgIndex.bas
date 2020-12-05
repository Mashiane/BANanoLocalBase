B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=8.5
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Private db As BANanoLocalBase
	Private banano As BANano
End Sub

Sub Initialize
	'open the database
	db.Initialize("mashy")
	
	'get the users collection
	'add a record
	Dim inow As Int = DateTime.Now
	Dim user As Map = CreateMap()
	user.Put("id", inow)
	user.Put("name", "Anele Mbanga (Mashy)")
	user.Put("age", 47)
	'
	Dim pr As Map
	Dim pe As Map
	
	Dim p As BANanoPromise = db.collection("users").add(user)
	banano.Await(p)
	p.Then(pr)
	Log("1. add a new user")
	Log(pr)
	p.Else(pe)
	p.End
	
	
	'get all records
	Dim aResponse As Map
	Dim aError As Map
	Dim dbGetAll As BANanoPromise = db.collection("users").get
	banano.Await(dbGetAll)
	dbGetAll.Then(aResponse)
	Log("2. get all records")
	Log(aResponse)
	dbGetAll.Else(aError)
	Log(aError)
	dbGetAll.End
	''
'	'add And update
'	db.collection("users").add(CreateMap("id":1, "name":"Mashy"))
'	'update a record
'	Dim uRecord As Map = CreateMap("name":"BANanoNinja")
'	db.collection("users").doc("id", 1).update(uRecord)
'	
'	'overwrite
'	db.collection("users").doc("id", 1).set(CreateMap("id":2, "name":"I dont know"))
''	
''	'overwrite all records
''	Dim recs As List
''	recs.Initialize
''	recs.Add(CreateMap("id":1, "name":"a"))
''	recs.Add(CreateMap("id":2, "name":"b"))
''	recs.Add(CreateMap("id":3, "name":"c"))
''	recs.Add(CreateMap("id":4, "name":"d"))
''	db.collection("users").set(recs)
''	
	'get records order by id asc
	Dim aResponse As Map
	Dim aError As Map
	Dim dbGetAll As BANanoPromise = db.collection("users").orderBy("id", db.LB_ASC).get
	banano.Await(dbGetAll)
	dbGetAll.Then(aResponse)
	Log("3. get ordered by id asc")
	Log(aResponse)
	dbGetAll.Else(aError)
	Log("Error")
	Log(aError)
	dbGetAll.End
	''	'
	'get records order by id desc, limit to 1
	Dim lResponse As Map
	Dim lError As Map
	Dim dbLimit As BANanoPromise = db.collection("users").orderBy("id", db.LB_DESC).limit(1).get
	dbLimit.Then(lResponse)
	Log("4. get ordered by id desc,limit 1")
	Log(lResponse)
	dbLimit.Else(lError)
	Log("Error")
	Log(lError)
	dbLimit.End
	''
''	
	'read a single record
	Dim rresponse As Map
	Dim rerror As Map
	Dim dbRead As BANanoPromise = db.collection("users").doc("id", 2).get
	banano.Await(dbRead)
	dbRead.Then(rresponse)
	Log("5. Read a document...")
	Log(rresponse)
	dbRead.Else(rerror)
	dbRead.end
'	'
'	'delete a record(s)
'	db.collection("users").doc("age", 47).delete
''	
	'add with key
	Dim user1 As Map = CreateMap()
	user1.Put("id", "1010")
	user1.Put("name", "Anele Mbanga (Mashy)")
	user1.Put("age", 50)
	Dim ra As Map
	Dim re As Map
	Dim pa As BANanoPromise = db.collection("users").addWithKey("1010", user1)
	banano.Await(pa)
	pa.Then(ra)
	Log("6. Added record by key...")
	Log(ra)
	pa.Else(re)
	pa.End
'	
'	'update with key, ensure all fields are updated this over-writes the complete record
'	db.collection("users").docWithKey("1010").set(CreateMap("id":"1010", "name":"Testing keys", "age":60))
'	
	'read document by key
	Dim rresponse1 As Map
	Dim rerror1 As Map
	Dim dbRead1 As BANanoPromise = db.collection("users").docWithKey("1010").get
	banano.Await(dbRead1)
	dbRead1.Then(rresponse1)
	Log("7. Read a document using key...")
	Log(rresponse1)
	dbRead1.Else(rerror1)
	dbRead1.end
'	'
''	'update with key
''	db.collection("users").docWithKey("1010").update(CreateMap("newfield":True))
''	
''	'delete with key
''	db.collection("users").docWithKey("1010").delete
''	
	'get all records with keys
	Dim aResponse2 As Map
	Dim aError2 As Map
	Dim dbGetAll2 As BANanoPromise = db.collection("users").orderBy("id", db.LB_DESC).GetWithKey
	banano.Await(dbGetAll2)
	dbGetAll2.Then(aResponse2)
	Log("8. ordered by id desc, get with keys")
	Log(aResponse2)
	dbGetAll2.Else(aError2)
	Log("Error")
	Log(aError2)
	dbGetAll2.End
'	
	
	'delete the collection
	'db.collection("users").delete
	
	'delete the database
	'db.delete

End Sub
