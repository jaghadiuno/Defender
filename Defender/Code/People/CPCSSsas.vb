Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class CPCSSSAs






    Public Shared Function getAllSSANames() As DataSet

        'Dim xFilteredView As New DataView(getAllSSAs)
        'Return xFilteredView

        'Return DB.RetrieveDataSet("SELECT DISTINCT Participant.FirstName +' '+ ISNULL(Participant.MiddleName, '') + ' ' + Participant.LastName AS ParticipantNameReverse FROM Participant;")

        Return DB.RetrieveDataSet("SELECT DISTINCT LOWER(Participant.FirstName +' ' + Participant.LastName) AS SSANameReverse FROM Participant INNER JOIN Role ON Participant.RoleID = Role.RoleID WHERE Participant.RoleID = 92;")

    End Function






End Class



