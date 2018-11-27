Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class CPCSCasesDAL



    Public Shared Function getCaseTypes() As DataTable

        Dim strCaseTypesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("CaseTypes")


        dt.Columns.Add("CaseTypeID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("CaseTypeName", Type.[GetType]("System.String"))

        Dim dr As DataRow




        Dim CaseTypesCommandStr As String = "SELECT [CaseTypeID], [CaseTypeName] FROM [dbo].[CaseType];"


        Dim CaseTypesCommand As SqlCommand = New SqlCommand(
          CaseTypesCommandStr, strCaseTypesConn)

        If strCaseTypesConn.State = ConnectionState.Closed Then strCaseTypesConn.Open()

        Dim CaseTypesReader As SqlDataReader = CaseTypesCommand.ExecuteReader()

        If CaseTypesReader.HasRows Then

            Do While CaseTypesReader.Read()


                dr = dt.NewRow()


                dr("CaseTypeID") = CaseTypesReader("CaseTypeID")
                dr("CaseTypeName") = CaseTypesReader("CaseTypeName")


                dt.Rows.Add(dr)

            Loop

        End If

        If strCaseTypesConn.State = ConnectionState.Open Then strCaseTypesConn.Close()

        Return dt

    End Function



    Public Shared Function getChargeTypes() As DataTable

        Dim strChargeTypesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ChargeTypes")


        dt.Columns.Add("ChargeID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ChargeTypeUSID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ChargeTypeStateID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("Offense", Type.[GetType]("System.String"))
        dt.Columns.Add("Chapter", Type.[GetType]("System.String"))
        dt.Columns.Add("Section", Type.[GetType]("System.String"))

        Dim dr As DataRow

        Dim ChargeTypesCommandStr As String = "SELECT [ChargeID], [ChargeTypeUSID], [ChargeTypeStateID], [Offense], [Chapter], [Section] FROM [Charge];"


        Dim ChargeTypesCcommand As SqlCommand = New SqlCommand(
          ChargeTypesCommandStr, strChargeTypesConn)

        If strChargeTypesConn.State = ConnectionState.Closed Then strChargeTypesConn.Open()

        Dim ChargeTypesReader As SqlDataReader = ChargeTypesCcommand.ExecuteReader()

        If ChargeTypesReader.HasRows Then

            Do While ChargeTypesReader.Read()


                dr = dt.NewRow()


                dr("ChargeID") = ChargeTypesReader("ChargeID")
                dr("ChargeTypeUSID") = ChargeTypesReader("ChargeTypeUSID")
                dr("ChargeTypeStateID") = ChargeTypesReader("ChargeTypeStateID")

                dr("Offense") = ChargeTypesReader("Offense")
                dr("Chapter") = ChargeTypesReader("Chapter")
                dr("Section") = ChargeTypesReader("Section")

                dt.Rows.Add(dr)

            Loop

        End If

        If strChargeTypesConn.State = ConnectionState.Open Then strChargeTypesConn.Close()

        Return dt

    End Function


    Public Shared Function getOffenses() As DataTable

        Dim strOffensesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("Offenses")

        dt.Columns.Add("Offense", Type.[GetType]("System.String"))

        Dim dr As DataRow
        Dim OffensesCommandStr As String = "df_SP_Offenses"


        Dim OffensesCcommand As SqlCommand = New SqlCommand(
          OffensesCommandStr, strOffensesConn)
        OffensesCcommand.CommandType = CommandType.StoredProcedure

        If strOffensesConn.State = ConnectionState.Closed Then strOffensesConn.Open()

        Dim OffensesReader As SqlDataReader = OffensesCcommand.ExecuteReader()

        If OffensesReader.HasRows Then

            Do While OffensesReader.Read()


                dr = dt.NewRow()

                dr("Offense") = OffensesReader("Offense")

                dt.Rows.Add(dr)

            Loop

        End If

        If strOffensesConn.State = ConnectionState.Open Then strOffensesConn.Close()

        Return dt

    End Function

    Public Shared Function getAllCases2(
Optional ByVal caseNo As String = Nothing,
Optional ByVal charge As String = Nothing,
Optional ByVal casetype As Int32 = Nothing,
Optional ByVal division As Int32 = Nothing,
Optional ByVal office As Int32 = Nothing,
Optional ByVal unitType As Int32 = Nothing,
Optional ByVal dteCaseOpenedFrom As DateTime = Nothing,
Optional ByVal dteCaseOpenedTo As DateTime = Nothing,
Optional ByVal dteCaseClosedFrom As DateTime = Nothing,
Optional ByVal dteCaseClosedTo As DateTime = Nothing,
Optional ByVal clientName As String = Nothing,
Optional ByVal participantName As String = Nothing,
Optional ByVal attorneyName As String = Nothing,
Optional ByVal prosecutorName As String = Nothing,
Optional ByVal judgeName As String = Nothing,
Optional ByVal ssaName As String = Nothing,
Optional ByVal investigatorName As String = Nothing,
Optional ByVal Custody As Int32 = Nothing,
Optional ByVal OpenStatus As Int32 = Nothing,
Optional ByVal ssaReferral As Int32 = Nothing
  ) As DataSet



        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dbConn As SqlConnection

        dbConn = DB.GetDataConnection()

        da = New SqlDataAdapter("df_SP_Cases_Search", dbConn)

        da.Fill(ds)

        dbConn.Close()
        dbConn = Nothing

        Return ds

    End Function
    Public Shared Function getAllCases(
Optional ByVal caseNo As String = Nothing,
Optional ByVal charge As String = Nothing,
Optional ByVal casetype As Int32 = Nothing,
Optional ByVal division As Int32 = Nothing,
Optional ByVal office As Int32 = Nothing,
Optional ByVal unitType As Int32 = Nothing,
Optional ByVal dteCaseOpenedFrom As DateTime = Nothing,
Optional ByVal dteCaseOpenedTo As DateTime = Nothing,
Optional ByVal dteCaseClosedFrom As DateTime = Nothing,
Optional ByVal dteCaseClosedTo As DateTime = Nothing,
Optional ByVal clientName As String = Nothing,
Optional ByVal participantName As String = Nothing,
Optional ByVal attorneyName As String = Nothing,
Optional ByVal prosecutorName As String = Nothing,
Optional ByVal judgeName As String = Nothing,
Optional ByVal ssaName As String = Nothing,
Optional ByVal investigatorName As String = Nothing,
Optional ByVal Custody As Int32 = Nothing,
Optional ByVal OpenStatus As Int32 = Nothing,
Optional ByVal ssaReferral As Int32 = Nothing
  ) As DataSet


        Dim strSQL As String

        strSQL = "SELECT DISTINCT [Case].CaseNumber, [Case].CaseID, [Case].CaseGUID, [Case].OpeningDate AS Opened, [Case].ClosingDate AS Closed, Client.ClientGUID, Client.FirstName + ' ' + Client.LastName AS ClientName, [Case].AdministrativelyClosed, [Case].[Open], YEAR([Case].OpeningDate) AS FiscalYear, CaseType.CaseTypeName, Department.DepartmentName, Division.DivisionName, Office.OfficeName, UnitType.UnitTypeName, Court.CourtName, Prosecutor.FirstName + ' ' + Prosecutor.LastName AS ProsecutorName, Judge.FirstName + ' ' + Judge.LastName AS JudgeName, Attorney.AttorneyGUID, Attorney.FirstName + ' ' + Attorney.LastName AS AttorneyName, Attorney.BBO AttorneyBBO FROM Attorney INNER JOIN CaseAttorney ON Attorney.AttorneyID = CaseAttorney.AttorneyID RIGHT OUTER JOIN [Case] INNER JOIN CaseType ON [Case].CaseTypeID = CaseType.CaseTypeID INNER JOIN Department ON [Case].DepartmentID = Department.DepartmentID INNER JOIN Division INNER JOIN Unit ON Division.DivisionID = Unit.DivisionID INNER JOIN Office ON Unit.OfficeID = Office.OfficeID INNER JOIN UnitType ON Unit.UnitTypeID = UnitType.UnitTypeID ON [Case].UnitID = Unit.UnitID ON CaseAttorney.CaseNumber = [Case].CaseNumber LEFT OUTER JOIN Client ON [Case].ClientID = Client.ClientID LEFT OUTER JOIN Judge ON [Case].JudgeID = Judge.JudgeID LEFT OUTER JOIN Court ON [Case].CourtID = Court.CourtID LEFT OUTER JOIN Prosecutor ON [Case].ProsecutorID = Prosecutor.ProsecutorID"


        'Open Cases
        strSQL += " WHERE NOT CONTAINS([Case].CaseNumber, 'test') AND NOT CONTAINS([Case].CaseNumber, 'tstcase')"



        'do search filter here

        If caseNo IsNot Nothing AndAlso Not String.IsNullOrEmpty(caseNo) Then
            strSQL += " AND Contains([Case].CaseNumber, '*" & caseNo.ToString.Trim.Replace(" ", " AND ") & "*')"
        End If


        'If Charge IsNot Nothing AndAlso Not String.IsNullOrEmpty(Charge) Then
        '    strSQL += " And Charge"
        'End If


        If casetype > 0 Then
            strSQL += " AND CaseType.CaseTypeID = " & casetype & ""
        End If


        If division > 0 Then
            strSQL += " And Division.DivisionID = " & division & ""
        End If


        If office > 0 Then
            strSQL += " AND Office.OfficeID = " & office & ""
        End If


        If unitType > 0 Then
            strSQL += " And UnitType.UnitTypeID = " & unitType & ""
        End If



        'If Not IsNothing(dteCaseOpenedFrom) AndAlso IsDate(dteCaseOpenedFrom) Then
        '    strSQL += " AND dteCaseOpenedFrom"
        'End If


        'If Not IsNothing(dteCaseOpenedTo) AndAlso IsDate(dteCaseOpenedTo) Then
        '    strSQL += " And dteCaseOpenedTo"
        'End If


        If clientName IsNot Nothing AndAlso Not String.IsNullOrWhiteSpace(clientName) Then
            strSQL += " AND LOWER(Client.FirstName +' ' + Client.LastName) = '" & clientName.ToLower & "'"
        End If


        'If ParticipantName IsNot Nothing AndAlso Not String.IsNullOrWhiteSpace(ParticipantName) Then
        '    strSQL += " And ParticipantName"
        'End If


        'If AttorneyName IsNot Nothing AndAlso Not String.IsNullOrWhiteSpace(AttorneyName) Then
        '    strSQL += " AND AttorneyName"
        'End If

        'If ProsecutorName IsNot Nothing AndAlso Not String.IsNullOrWhiteSpace(ProsecutorName) Then
        '    strSQL += " And ProsecutorName"
        'End If

        'If JudgeName IsNot Nothing AndAlso Not String.IsNullOrWhiteSpace(JudgeName) Then
        '    strSQL += " AND JudgeName"
        'End If


        'If SSAName IsNot Nothing AndAlso Not String.IsNullOrWhiteSpace(SSAName) Then
        '    strSQL += " And SSAName"
        'End If


        'If InvestigatorName IsNot Nothing AndAlso Not String.IsNullOrWhiteSpace(InvestigatorName) Then
        '    strSQL += " AND InvestigatorName"
        'End If




        ' Checkboxes

        'If HeldInCustody Then
        '    strSQL += " And HeldInCustody"
        'End If


        'If CaseIsOpen Then
        '    strSQL += " AND CaseIsOpen"
        'End If


        'If CaseIsDisposed Then
        '    strSQL += " And CaseIsDisposed"
        'End If


        'If SSAReferral Then
        '    strSQL += " AND SSAReferral"
        'End If


        'If InvestigatorReferral Then
        '    strSQL += " And InvestigatorReferral"
        'End If

        strSQL += " ORDER BY [Case].CaseNumber DESC"

        Return DB.RetrieveDataSet(strSQL.ToString)

    End Function




End Class

