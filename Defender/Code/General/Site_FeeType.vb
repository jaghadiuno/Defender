Imports Microsoft.VisualBasic

Public Class FeeType
    Private _FeeName As String
    Private _Amount As String
    Private _ConvenienceAmount As String

    Public Property FeeName() As String
        Get
            Return _FeeName
        End Get

        Set(ByVal Value As String)
            _FeeName = Value
        End Set
    End Property

    Public Property Amount() As Double
        Get
            Return _Amount
        End Get

        Set(ByVal Value As Double)
            _Amount = Value
        End Set
    End Property

    Public Property ConvenienceAmount() As Double
        Get
            Return _ConvenienceAmount
        End Get

        Set(ByVal Value As Double)
            _ConvenienceAmount = Value
        End Set
    End Property

End Class
