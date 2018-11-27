Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Public Class AttorneyCaseReports


    Public Shared Function getAttorneyCaseMetrics(
                ByVal AttorneyID As Int32,
                ByVal AttorneyGUID As Guid,
                Optional ByVal AssignedOptions As String = Nothing,
                Optional ByVal AssignedStartDate As String = Nothing,
                Optional ByVal AssignedEndDate As String = Nothing,
                Optional ByVal UnAssignedOptions As String = Nothing,
                Optional ByVal UnAssignedStartDate As String = Nothing,
                Optional ByVal UnAssignedEndDate As String = Nothing
) As DataTable
        Dim xHasGUIDParameters As Boolean
        Dim xHasOpenDateParameters As Boolean
        Dim xHasCloseDateParameters As Boolean
        If (Not String.IsNullOrWhiteSpace(AttorneyID.ToString.Trim) AndAlso Not String.IsNullOrWhiteSpace(AttorneyGUID.ToString.Trim)) Then xHasGUIDParameters = True
        If IsDate(AssignedStartDate) Or IsDate(AssignedEndDate) Then xHasOpenDateParameters = True
        If IsDate(UnAssignedStartDate) Or IsDate(UnAssignedEndDate) Then xHasCloseDateParameters = True
        Dim xFilterAttorney As String = ""
        Dim xFilterDates = ""
        If xHasGUIDParameters Then xFilterAttorney += " And (AttorneyID = @AttorneyID)"
        'xFilterDates += " AND (AttorneyCaseYears.CountYear IS NOT NULL) AND (AttorneyCaseYears.AttorneyID IS NOT NULL) AND (Attorney.AttorneyGUID IS NOT NULL)"
        If xHasOpenDateParameters Then
            If AssignedOptions = "Assigned On" Then
                xFilterDates += " AND (DateAssigned = @AssignedStartDate)"
            Else
                xFilterDates += " AND (DateAssigned BETWEEN @AssignedStartDate AND @AssignedEndDate)"
            End If
        End If
        If xHasCloseDateParameters Then
            If UnAssignedOptions = "Un-Assigned On" Then
                xFilterDates += " AND (DateUnAssigned = @UnAssignedStartDate)"
            Else
                xFilterDates += " AND (DateUnAssigned BETWEEN @UnAssignedStartDate AND @UnAssignedEndDate)"
            End If
        End If
        Dim strAssignmentsCountConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim dt As New DataTable("AttorneyCaseMetricsTable")
        dt.Columns.Add("AttorneyID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("CountYear", Type.[GetType]("System.Int32"))
        dt.Columns.Add("Assignments", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ActiveAtStart", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ProbationViolations", Type.[GetType]("System.Int32"))
        dt.Columns.Add("BailOnly", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ClosedCases", Type.[GetType]("System.Int32"))
        Dim dr As DataRow
        Dim strBuilder As New StringBuilder
        strBuilder.Append("")
        strBuilder.Append("SELECT DISTINCT Attorney.FirstName + ' ' + Attorney.LastName,  AttorneyCaseYears.AttorneyID, AttorneyCaseYears.CountYear, ")
        'Assignment Count
        strBuilder.Append("(")
        strBuilder.Append("SELECT COUNT(CaseNumber) AS AssignmentsCC FROM CaseAttorney AS tblAssignmentsCA WHERE (YEAR(DateAssigned) = AttorneyCaseYears.CountYear) AND (AttorneyID = AttorneyCaseYears.AttorneyID) ")
        strBuilder.Append(xFilterDates)
        strBuilder.Append(") AS Assignments, ")
        'Active at Start
        strBuilder.Append("(")
        strBuilder.Append("SELECT COUNT(CaseNumber) AS ActiveAtStartC FROM CaseAttorney AS tblAAS WHERE (YEAR(DateAssigned) < AttorneyCaseYears.CountYear) AND (YEAR(DateUnAssigned) >= AttorneyCaseYears.CountYear OR DateUnAssigned IS NULL) AND (AttorneyID = AttorneyCaseYears.AttorneyID) ")
        strBuilder.Append(xFilterDates)
        strBuilder.Append(") AS ActiveAtStart, ")
        'Probation Violations
        strBuilder.Append("(")
        strBuilder.Append("SELECT COUNT(tblProbViol.CaseNumber) AS ProbViolC FROM CaseAttorney AS tblProbViol INNER JOIN [Case] ON tblProbViol.CaseNumber = [Case].CaseNumber INNER JOIN CaseType ON [Case].CaseTypeID = CaseType.CaseTypeID WHERE (CaseType.CaseTypeID = 4) AND (YEAR(tblProbViol.DateAssigned) = AttorneyCaseYears.CountYear) AND (tblProbViol.AttorneyID = AttorneyCaseYears.AttorneyID) ")
        strBuilder.Append(xFilterDates)
        strBuilder.Append(") AS ProbationViolations, ")
        'Bail Only Count
        strBuilder.Append("(")
        strBuilder.Append("SELECT COUNT(tblBailOnly.CaseNumber) AS BailOnlyC FROM CaseAttorney AS tblBailOnly INNER JOIN [Case] AS Case_1 ON tblBailOnly.CaseNumber = Case_1.CaseNumber INNER JOIN CaseType AS CaseType_1 ON Case_1.CaseTypeID = CaseType_1.CaseTypeID WHERE (CaseType_1.CaseTypeID = 16) AND (YEAR(tblBailOnly.DateAssigned) = AttorneyCaseYears.CountYear) AND (tblBailOnly.AttorneyID = AttorneyCaseYears.AttorneyID) ")
        strBuilder.Append(xFilterDates)
        strBuilder.Append(") AS BailOnly, ")
        'Unassignments
        strBuilder.Append("(")
        strBuilder.Append("SELECT COUNT(CaseNumber) AS UnAssignmentsC FROM CaseAttorney AS tblCCs WHERE (YEAR(DateUnassigned) IS NOT NULL) AND (YEAR(DateUnassigned) = AttorneyCaseYears.CountYear) AND (AttorneyID = AttorneyCaseYears.AttorneyID)")
        strBuilder.Append(xFilterDates)
        strBuilder.Append(") AS UnAssignments ")
        strBuilder.Append("FROM (")
        strBuilder.Append("SELECT DISTINCT AttorneyID, YEAR(DateAssigned) AS CountYear FROM CaseAttorney ")
        strBuilder.Append("WHERE CaseAttorney.AttorneyID IS NOT NULL ")
        strBuilder.Append(xFilterAttorney)
        strBuilder.Append(xFilterDates)
        strBuilder.Append("UNION SELECT DISTINCT AttorneyID, YEAR(DateUnassigned) AS CountYear FROM CaseAttorney AS CaseAttorney_1 ")
        strBuilder.Append("WHERE CaseAttorney_1.AttorneyID IS NOT NULL ")
        strBuilder.Append(xFilterAttorney)
        strBuilder.Append(xFilterDates)
        strBuilder.Append(") AS AttorneyCaseYears ")
        strBuilder.Append(" INNER JOIN Attorney ON AttorneyCaseYears.AttorneyID = Attorney.AttorneyID")
        strBuilder.Append(" WHERE (AttorneyCaseYears.CountYear IS NOT NULL) AND (AttorneyCaseYears.AttorneyID IS NOT NULL) AND (AttorneyGUID IS NOT NULL)")
        If xHasOpenDateParameters Then
            If AssignedOptions = "Assigned On" Then
                xFilterDates += " AND (AttorneyCaseYears.CountYear = YEAR(@AssignedStartDate))"
            Else
                xFilterDates += " AND (AttorneyCaseYears.CountYear BETWEEN YEAR(@AssignedStartDate) AND YEAR(@AssignedEndDate))"
            End If
        End If
        If xHasCloseDateParameters Then
            If UnAssignedOptions = "Un-Assigned On" Then
                xFilterDates += " AND (AttorneyCaseYears.CountYear = YEAR(@UnAssignedStartDate))"
            Else
                xFilterDates += " AND (AttorneyCaseYears.CountYear BETWEEN YEAR(@UnAssignedStartDate) AND YEAR(@UnAssignedEndDate))"
            End If
        End If
        strBuilder.Append(" ORDER BY AttorneyCaseYears.CountYear")
        strBuilder.Append("")
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAssignmentsCountConn)
        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@AttorneyID", AttorneyID)
        cmd.Parameters.AddWithValue("@AttorneyGUID", AttorneyGUID)
        cmd.Parameters.AddWithValue("@AssignedStartDate", IIf(IsDate(AssignedStartDate), AssignedStartDate, Now.AddYears(-10).Date))
        cmd.Parameters.AddWithValue("@AssignedEndDate", IIf(IsDate(AssignedEndDate), AssignedEndDate, Now.Date))
        cmd.Parameters.AddWithValue("@UnAssignedStartDate", IIf(IsDate(UnAssignedStartDate), UnAssignedStartDate, Now.Date.AddYears(-10).Date))
        cmd.Parameters.AddWithValue("@UnAssignedEndDate", IIf(IsDate(UnAssignedEndDate), UnAssignedEndDate, Now.Date))
        If strAssignmentsCountConn.State = ConnectionState.Closed Then strAssignmentsCountConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                dr = dt.NewRow()
                dr("AttorneyID") = rdr("AttorneyID")
                dr("CountYear") = rdr("CountYear")
                dr("Assignments") = rdr("Assignments")
                dr("ActiveAtStart") = rdr("ActiveAtStart")
                dr("ProbationViolations") = rdr("ProbationViolations")
                dr("BailOnly") = rdr("BailOnly")
                dr("ClosedCases") = rdr("UnAssignments")
                dt.Rows.Add(dr)
            Loop
        End If
        If strAssignmentsCountConn.State = ConnectionState.Open Then strAssignmentsCountConn.Close()
        dt.DefaultView.RowFilter = "(Assignments+ActiveAtStart+ProbationViolations+BailOnly+ClosedCases > 1)"
        Return dt
    End Function
    Public Shared Function getAttorneyAssignmentMetrics(
                ByVal AttorneyID As Int32,
                ByVal AttorneyGUID As Guid,
                ByVal AssignedStartDate As String,
                ByVal AssignedEndDate As String
) As DataTable
        Dim xHasGUIDParameters As Boolean
        Dim xHasOpenDateParameters As Boolean

        If (Not String.IsNullOrWhiteSpace(AttorneyID.ToString.Trim) AndAlso Not String.IsNullOrWhiteSpace(AttorneyGUID.ToString.Trim)) Then xHasGUIDParameters = True
        If IsDate(AssignedStartDate) Or IsDate(AssignedEndDate) Then xHasOpenDateParameters = True

        Dim xFilterAttorney As String = ""
        Dim xFilterDates = ""
        If xHasGUIDParameters Then xFilterAttorney += " And (AttorneyID = @AttorneyID)"



        Dim strAssignmentsCountConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim dt As New DataTable("AttorneyCaseMetricsTable")
        dt.Columns.Add("AttorneyID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("CountYear", Type.[GetType]("System.Int32"))
        dt.Columns.Add("Assignments", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ProbationViolations", Type.[GetType]("System.Int32"))
        dt.Columns.Add("BailOnly", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ClosedCases", Type.[GetType]("System.Int32"))
        dt.Columns.Add("TotalCases", Type.[GetType]("System.Int32"))
        Dim dr As DataRow
        Dim strBuilder As New StringBuilder
        strBuilder.Append("")
        strBuilder.Append("SELECT ")
        strBuilder.Append("Year(DateAssigned) CountYear, ")
        strBuilder.Append("SUM(BailOnlyAssigned) BailOnly, ")
        strBuilder.Append("SUM(Assigned) Assignments, ")
        strBuilder.Append("SUM(ProbationViolationAssigned) ProbationViolations, ")
        strBuilder.Append("SUM(UnAssigned) UnAssignments,	")
        strBuilder.Append("SUM(TotalCasesTouched) TotalCases ")
        strBuilder.Append("From FN_Metrics_Assignments(@AssignedStartDate,@AssignedEndDate) ")
        strBuilder.Append("Where AttorneyGUID Like @AttorneyGUID AND YEAR(DateAssigned) >= YEAR(@AssignedStartDate) AND YEAR(DateAssigned) <= YEAR(@AssignedEndDate) ")
        strBuilder.Append("Group BY Year(DateAssigned) ORDER BY Year(DateAssigned) ASC")


        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAssignmentsCountConn)
        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@AttorneyID", AttorneyID)
        cmd.Parameters.AddWithValue("@AttorneyGUID", AttorneyGUID)
        cmd.Parameters.AddWithValue("@AssignedStartDate", IIf(IsDate(AssignedStartDate), AssignedStartDate, Now.AddYears(-10).Date))
        cmd.Parameters.AddWithValue("@AssignedEndDate", IIf(IsDate(AssignedEndDate), AssignedEndDate, Now.Date))



        If strAssignmentsCountConn.State = ConnectionState.Closed Then strAssignmentsCountConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                dr = dt.NewRow()
                dr("AttorneyID") = AttorneyID
                dr("CountYear") = rdr("CountYear")
                dr("Assignments") = rdr("Assignments")
                dr("ProbationViolations") = rdr("ProbationViolations")
                dr("BailOnly") = rdr("BailOnly")
                dr("ClosedCases") = rdr("UnAssignments")
                dr("TotalCases") = rdr("TotalCases")
                dt.Rows.Add(dr)
            Loop
        End If
        If strAssignmentsCountConn.State = ConnectionState.Open Then strAssignmentsCountConn.Close()
        dt.DefaultView.RowFilter = "(Assignments+ProbationViolations+BailOnly+ClosedCases > 1)"
        Return dt
    End Function



    Public Shared Function getAllAttorneyCases(
                ByVal AttorneyID As Int32,
                ByVal AttorneyGUID As Guid,
                Optional ByVal AssignedOptions As String = Nothing,
                Optional ByVal AssignedStartDate As String = Nothing,
                Optional ByVal AssignedEndDate As String = Nothing,
                Optional ByVal UnAssignedOptions As String = Nothing,
                Optional ByVal UnAssignedStartDate As String = Nothing,
                Optional ByVal UnAssignedEndDate As String = Nothing
) As DataSet
        Return DB.RetrieveDataSet("Select DISTINCT [Case].CaseNumber, [Case].CaseID, [Case].CaseGUID, [Case].OpeningDate As Opened, [Case].ClosingDate As Closed, Client.ClientGUID, Client.FirstName + ' ' + Client.LastName AS ClientName, [Case].AdministrativelyClosed, [Case].[Open], YEAR([Case].OpeningDate) AS FiscalYear, CaseType.CaseTypeName, Department.DepartmentName, Division.DivisionName, Office.OfficeName, UnitType.UnitTypeName, Court.CourtName, Prosecutor.FirstName + ' ' + Prosecutor.LastName AS ProsecutorName, Judge.FirstName + ' ' + Judge.LastName AS JudgeName, Attorney.AttorneyGUID, Attorney.FirstName + ' ' + Attorney.LastName AS AttorneyName, Attorney.BBO AttorneyBBO, CaseAttorney.DateAssigned, CaseAttorney.DateUnassigned, AssignmentType.AssignmentTypeName + ' Attorney' AS AssignmentTypeName FROM Attorney INNER JOIN CaseAttorney ON Attorney.AttorneyID = CaseAttorney.AttorneyID LEFT OUTER JOIN AssignmentType ON CaseAttorney.AssignmentTypeID = AssignmentType.AssignmentTypeID RIGHT OUTER JOIN [Case] INNER JOIN CaseType ON [Case].CaseTypeID = CaseType.CaseTypeID INNER JOIN Department ON [Case].DepartmentID = Department.DepartmentID INNER JOIN Division INNER JOIN Unit ON Division.DivisionID = Unit.DivisionID INNER JOIN Office ON Unit.OfficeID = Office.OfficeID INNER JOIN UnitType ON Unit.UnitTypeID = UnitType.UnitTypeID ON [Case].UnitID = Unit.UnitID ON CaseAttorney.CaseNumber = [Case].CaseNumber LEFT OUTER JOIN Client ON [Case].ClientID = Client.ClientID LEFT OUTER JOIN Judge ON [Case].JudgeID = Judge.JudgeID LEFT OUTER JOIN Court ON [Case].CourtID = Court.CourtID LEFT OUTER JOIN Prosecutor ON [Case].ProsecutorID = Prosecutor.ProsecutorID WHERE  Attorney.AttorneyGUID LIKE '" & AttorneyGUID.ToString & "' AND AssignmentType.AssignmentTypeID IN (1,2)")
    End Function




End Class