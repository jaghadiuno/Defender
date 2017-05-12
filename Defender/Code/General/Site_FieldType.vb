Imports Microsoft.VisualBasic

<Serializable()>
Public Class FieldType
    Private _fieldname As String
    Private _fieldvalue As String

    Public Property FieldName() As String
        Get
            Return _fieldname
        End Get

        Set(ByVal Value As String)
            _fieldname = Value
        End Set
    End Property

    Public Property FieldValue() As String
        Get
            Return _fieldvalue
        End Get

        Set(ByVal Value As String)
            _fieldvalue = Value
        End Set
    End Property

    Public Sub New(ByVal FieldName As String, ByVal FieldValue As String)
        _fieldname = FieldName
        _fieldvalue = FieldValue
    End Sub

    Public Function Save(ByVal intFormId As Integer) As Boolean
        Try
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
