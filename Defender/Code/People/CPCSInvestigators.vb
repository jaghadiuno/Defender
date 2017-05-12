Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class CPCSInvestigators






    Public Shared Function getAllInvestigatorNames() As DataSet


        'Dim xFilteredView As New DataView(getAllInvestigators)
        'Return xFilteredView


        'Return DB.RetrieveDataSet("SELECT DISTINCT Participant.FirstName +' '+ ISNULL(Participant.MiddleName, '') + ' ' + Participant.LastName AS ParticipantNameReverse FROM Participant;")

        Return DB.RetrieveDataSet("SELECT DISTINCT LOWER(Participant.FirstName +' ' + Participant.LastName) AS InvestigatorNameReverse FROM Participant INNER JOIN Role ON Participant.RoleID = Role.RoleID WHERE Participant.RoleID = 91;")

    End Function






End Class



