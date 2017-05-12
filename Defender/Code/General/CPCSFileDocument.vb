Imports Microsoft.VisualBasic
Imports System.Data
Imports System.IO
Imports System.Data.SqlClient

<Serializable()>
Public Class eFileDocument
    Public Const PLAINTIFF_TYPE As Integer = 1
    Public Const DEFENDANT_TYPE As Integer = 2

    Public Const UPLOAD_DOCS As Integer = 1
    Public Const FAX_DOCS As Integer = 2

    Private _DocumentGUID As Guid = Guid.NewGuid
    Private _FormFolder As String = ""
    Private _FormName As String = ""
    Private _FormTitle As String
    Private _FormID As String
    Private _Fields As FieldType()
    Private _AffiantType As String
    Private _InvoiceNumber As String
    Private _CardNum As String
    Private _CardName As String
    Private _CardEmail As String
    Private _CardType As String
    Private _Document As Byte()
    Private _TransactionId As String
    Private _SubmitDate As String
    Private _FormLogId As Integer
    Private _IsUpload As Boolean = True
    Private _IsAttest As Boolean = False
    Private _IsSubmitted As Boolean = False


    Public Sub New(ByVal DocTypeId As String, ByVal JurisFolder As String)
        _FormID = DocTypeId
        InitFormInfo(DocTypeId)
    End Sub

    Private Sub InitFields()
        Dim strSQL As String = "SELECT * FROM FORM_DETAILS WHERE FormLogId = " & _FormLogId
        Dim db As New DB
        Dim ds As DataSet = DB.RetrieveDataSet(strSQL)
        For Each row As DataRow In ds.Tables(0).Rows
            Dim objF As New FieldType(row("FieldName"), row("FieldValue"))
            If _Fields Is Nothing Then
                ReDim _Fields(0)
            Else
                ReDim Preserve _Fields(UBound(Fields) + 1)
            End If
            _Fields(UBound(Fields)) = objF
        Next
    End Sub

    Public Sub ClearFields()
        _Fields = Nothing
    End Sub

    Public Function GetFieldValue(ByVal FieldName As String) As String
        If _Fields Is Nothing Then
            Return ""
        End If

        For Each objField As FieldType In _Fields
            'File.AppendAllText("C:\J.txt", objField.FieldName.ToLower & "|" & FieldName & "|" & objField.FieldName.ToLower.Contains(FieldName.ToLower) & vbCrLf)
            If objField.FieldName.ToLower.Contains(FieldName.ToLower) Then
                If FieldName.ToLower = "principal" And Not IsNumeric(objField.FieldValue) Then
                    Return 0
                End If
                Return objField.FieldValue
            End If
        Next
        Return ""
    End Function

    Public Sub AddField(ByVal FieldName As String, ByVal FieldValue As String)

        If _Fields IsNot Nothing Then
            For Each aField As FieldType In _Fields
                If aField.FieldName.ToUpper = UCase(FieldName) Then
                    aField.FieldValue = FieldValue
                    Exit Sub
                End If
            Next
        End If

        If _Fields Is Nothing Then
            ReDim _Fields(0)
        Else
            ReDim Preserve _Fields(UBound(_Fields) + 1)
        End If
        _Fields(UBound(_Fields)) = New FieldType(FieldName, FieldValue)
    End Sub

    Private Sub InitFormInfo(ByVal id As String)
        Dim strSQL As String = "SELECT FormFolder, DocName FROM DOCUMENTS WHERE DocCode = '" & id & "'"
        Dim db As New DB
        Dim ds As DataSet = DB.RetrieveDataSet(strSQL)
        If ds.Tables(0).Rows.Count = 0 Then
            Exit Sub
        End If

        If Not DBNull.Value.Equals(ds.Tables(0).Rows(0)("FormFolder")) Then
            _FormFolder = ds.Tables(0).Rows(0)("FormFolder")
        End If
        If Not DBNull.Value.Equals(ds.Tables(0).Rows(0)("DocName")) Then
            _FormName = ds.Tables(0).Rows(0)("DocName")
        End If
        _FormID = id
    End Sub

    Public Property DocumentGUID() As Guid
        Get
            Return _DocumentGUID
        End Get
        Set(ByVal value As Guid)
            _DocumentGUID = value
        End Set
    End Property

    Public Property FormID() As String
        Get
            Return _FormID
        End Get

        Set(ByVal Value As String)
            _FormID = Value
        End Set
    End Property

    Public Property IsUpload() As Boolean
        Get
            Return _IsUpload
        End Get

        Set(ByVal Value As Boolean)
            _IsUpload = Value
        End Set
    End Property

    Public Property IsAttest() As Boolean
        Get
            Return _IsAttest
        End Get

        Set(ByVal Value As Boolean)
            _IsAttest = Value
        End Set
    End Property



    Public ReadOnly Property Fields() As FieldType()
        Get
            Return _Fields
        End Get
    End Property

    Public Property FormFolder() As String
        Get
            Return _FormFolder
        End Get

        Set(ByVal Value As String)
            _FormFolder = Value
        End Set
    End Property

    Public Property InvoiceNumber() As String
        Get
            Return _InvoiceNumber
        End Get

        Set(ByVal Value As String)
            _InvoiceNumber = Value
        End Set
    End Property

    Public Property TransactionId() As String
        Get
            Return _TransactionId
        End Get

        Set(ByVal Value As String)
            _TransactionId = Value
        End Set
    End Property

    Public Property CardNumber() As String
        Get
            Return _CardNum
        End Get
        Set(ByVal value As String)
            _CardNum = value
        End Set
    End Property

    Public Property CardName() As String
        Get
            Return _CardName
        End Get

        Set(ByVal Value As String)
            _CardName = Value
        End Set
    End Property

    Public Property CardEmail() As String
        Get
            Return _CardEmail
        End Get

        Set(ByVal Value As String)
            _CardEmail = Value
        End Set
    End Property

    Public Property CardType() As String
        Get
            Return _CardType
        End Get

        Set(ByVal Value As String)
            _CardType = Value
        End Set
    End Property


    Public Property FormName() As String
        Get
            Return _FormName
        End Get

        Set(ByVal Value As String)
            _FormName = Value
        End Set
    End Property

    Public Property FormTitle() As String
        Get
            Return _FormTitle
        End Get

        Set(ByVal Value As String)
            _FormTitle = Value
        End Set
    End Property

    Public Property AffiantType() As String
        Get
            Return _AffiantType
        End Get

        Set(ByVal Value As String)
            _AffiantType = Value
        End Set
    End Property

    Private Function SaveFields(ByVal intFormLogId As Integer) As Boolean
        If Fields Is Nothing Then
            Return True
        End If

        For Each objF As FieldType In Fields
            If Not objF.Save(intFormLogId) Then
                Return False
            End If
        Next
        Return True
    End Function


End Class
