Imports System.Data.SqlClient

Public Class CaseDetails


    'Public Shared Function getCaseDetails(ByVal CaseGUID As Guid) As DataTable

    '    Dim strCaseDetailsConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


    '    Dim dt As New DataTable("CaseDetails")


    '    dt.Columns.Add("CaseTypeID", Type.[GetType]("System.Int32"))
    '    dt.Columns.Add("CaseTypeName", Type.[GetType]("System.String"))

    '    Dim dr As DataRow




    '    Dim CaseDetailsCommandStr As String = "SELECT [CaseTypeID], [CaseTypeName] FROM [dbo].[CaseType];"


    '    Dim CaseDetailsCommand As SqlCommand = New SqlCommand(
    '      CaseDetailsCommandStr, strCaseDetailsConn)

    '    If strCaseDetailsConn.State = ConnectionState.Closed Then strCaseDetailsConn.Open()

    '    Dim CaseDetailsReader As SqlDataReader = CaseDetailsCommand.ExecuteReader()

    '    If CaseDetailsReader.HasRows Then

    '        Do While CaseDetailsReader.Read()


    '            dr = dt.NewRow()


    '            dr("CaseTypeID") = CaseDetailsReader("CaseTypeID")
    '            dr("CaseTypeName") = CaseDetailsReader("CaseTypeName")


    '            dt.Rows.Add(dr)

    '        Loop

    '    End If

    '    If strCaseDetailsConn.State = ConnectionState.Open Then strCaseDetailsConn.Close()

    '    Return dt

    'End Function


    Public Shared Function getCaseDetails(ByVal CaseGUID As Guid) As DataSet

        Return DB.RetrieveDataSet("SELECT * FROM df_VW_CaseDetails WHERE CaseGUID LIKE '" & CaseGUID.ToString & "'")

        Return Nothing

    End Function




    Public Shared Function getCaseCharges(ByVal CaseGUID As Guid) As DataTable

        Dim strChargeTypesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("CaseChargeTypes")


        dt.Columns.Add("CaseGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("CaseNumber", Type.[GetType]("System.String"))



        dt.Columns.Add("CaseChargeID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("DocketNumber", Type.[GetType]("System.String"))



        dt.Columns.Add("Sentence", Type.[GetType]("System.String"))


        dt.Columns.Add("DateOfOffense", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("DateOfDisposition", Type.[GetType]("System.DateTime"))



        dt.Columns.Add("Note", Type.[GetType]("System.String"))



        dt.Columns.Add("IsLeadCharge", Type.[GetType]("System.Boolean"))
        dt.Columns.Add("IsComitted", Type.[GetType]("System.Boolean"))
        dt.Columns.Add("LeadChargeCalc", Type.[GetType]("System.Boolean"))



        dt.Columns.Add("Offense", Type.[GetType]("System.String"))
        dt.Columns.Add("Chapter", Type.[GetType]("System.Int32"))
        dt.Columns.Add("Section", Type.[GetType]("System.Int32"))


        dt.Columns.Add("StateChargeTypeName", Type.[GetType]("System.String"))
        dt.Columns.Add("StateChargeSeverity", Type.[GetType]("System.Int32"))

        dt.Columns.Add("NationalChargeTypeName", Type.[GetType]("System.String"))
        dt.Columns.Add("NationalChargeSeverity", Type.[GetType]("System.Int32"))

        dt.Columns.Add("ChargeStatusName", Type.[GetType]("System.String"))
        dt.Columns.Add("DispositionName", Type.[GetType]("System.String"))

        dt.Columns.Add("SentenceTypeName", Type.[GetType]("System.String"))
        dt.Columns.Add("CourtLevelName", Type.[GetType]("System.String"))



        Dim dr As DataRow

        Dim ChargeTypesCommandStr As String = "SELECT [Case].CaseGUID, [Case].CaseNumber, CaseCharge.CaseChargeID, CaseCharge.DocketNumber, CaseCharge.Sentence, CaseCharge.DateOfOffense, CaseCharge.DateOfDisposition, CaseCharge.Note, CaseCharge.IsLeadCharge, CaseCharge.IsComitted, CaseCharge.LeadChargeCalc, Charge.Offense, Charge.Chapter, Charge.Section, ChargeTypeState.StateCode, ChargeTypeState.ChargeTypeName AS StateChargeTypeName, ChargeTypeState.Severity AS StateChargeSeverity, ChargeTypeUS.ChargeTypeUSID, ChargeTypeUS.ChargeTypeName AS NationalChargeTypeName, ChargeTypeUS.Severity AS NationalChargeSeverity, ChargeStatus.ChargeStatusName, Disposition.DispositionName, SentenceType.SentenceTypeName, CourtLevel.CourtLevelName FROM CaseCharge INNER JOIN [Case] ON CaseCharge.CaseNumber = [Case].CaseNumber INNER JOIN Charge ON CaseCharge.ChargeID = Charge.ChargeID INNER JOIN ChargeTypeState ON Charge.ChargeTypeStateID = ChargeTypeState.ChargeTypeStateID INNER JOIN ChargeTypeUS ON Charge.ChargeTypeUSID = ChargeTypeUS.ChargeTypeUSID LEFT OUTER JOIN ChargeStatus ON CaseCharge.ChargeStatusID = ChargeStatus.ChargeStatusID LEFT OUTER JOIN Disposition ON CaseCharge.DispositionID = Disposition.DispositionID LEFT OUTER JOIN SentenceType ON CaseCharge.SentenceTypeID = SentenceType.SentenceTypeID LEFT OUTER JOIN CourtLevel ON CaseCharge.CourtLevelID = CourtLevel.CourtLevelID WHERE [Case].CaseGUID=@CaseGUID ORDER BY  CaseCharge.IsLeadCharge DESC, CaseCharge.DocketNumber"



        Dim ChargeTypesCcommand As SqlCommand = New SqlCommand(
          ChargeTypesCommandStr, strChargeTypesConn)

        ChargeTypesCcommand.Parameters.Clear()
        ChargeTypesCcommand.Parameters.AddWithValue("@CaseGUID", CaseGUID)

        If strChargeTypesConn.State = ConnectionState.Closed Then strChargeTypesConn.Open()

        Dim ChargeTypesReader As SqlDataReader = ChargeTypesCcommand.ExecuteReader()

        If ChargeTypesReader.HasRows Then

            Do While ChargeTypesReader.Read()


                dr = dt.NewRow()


                dr("CaseGUID") = ChargeTypesReader("CaseGUID")
                dr("CaseNumber") = ChargeTypesReader("CaseNumber")

                dr("CaseChargeID") = ChargeTypesReader("CaseChargeID")
                dr("DocketNumber") = ChargeTypesReader("DocketNumber")

                dr("Sentence") = ChargeTypesReader("Sentence")

                dr("DateOfOffense") = ChargeTypesReader("DateOfOffense")
                dr("DateOfDisposition") = ChargeTypesReader("DateOfDisposition")

                dr("Note") = ChargeTypesReader("Note")

                dr("IsLeadCharge") = ChargeTypesReader("IsLeadCharge")
                dr("IsComitted") = ChargeTypesReader("IsComitted")

                dr("LeadChargeCalc") = ChargeTypesReader("LeadChargeCalc")

                dr("Offense") = ChargeTypesReader("Offense")
                dr("Chapter") = ChargeTypesReader("Chapter")
                dr("Section") = ChargeTypesReader("Section")



                dr("StateChargeTypeName") = ChargeTypesReader("StateChargeTypeName")
                dr("StateChargeSeverity") = ChargeTypesReader("StateChargeSeverity")

                dr("NationalChargeTypeName") = ChargeTypesReader("NationalChargeTypeName")
                dr("NationalChargeSeverity") = ChargeTypesReader("NationalChargeSeverity")

                dr("ChargeStatusName") = ChargeTypesReader("ChargeStatusName")
                dr("DispositionName") = ChargeTypesReader("DispositionName")

                dr("SentenceTypeName") = ChargeTypesReader("SentenceTypeName")
                dr("CourtLevelName") = ChargeTypesReader("CourtLevelName")


                dt.Rows.Add(dr)

            Loop

        End If

        If strChargeTypesConn.State = ConnectionState.Open Then strChargeTypesConn.Close()

        Return dt

    End Function






    Public Shared Function getCaseAttorneys(ByVal CaseGUID As Guid) As DataTable

        Dim strAttorneysConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("CaseAttorneys")


        dt.Columns.Add("AttorneyGUID", Type.[GetType]("System.String"))

        dt.Columns.Add("DateAssigned", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("DateUnAssigned", Type.[GetType]("System.DateTime"))

        dt.Columns.Add("BBO", Type.[GetType]("System.String"))

        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyName", Type.[GetType]("System.String"))




        dt.Columns.Add("AssignmentTypeName", Type.[GetType]("System.String"))


        Dim dr As DataRow

        Dim AttorneysCommandStr As String = "SELECT DISTINCT CaseAttorney.DateAssigned, CaseAttorney.DateUnassigned, Attorney.AttorneyGUID, Attorney.BBO, Attorney.FirstName AttorneyName, Attorney.FirstName, Attorney.MiddleName, Attorney.LastName, AssignmentType.AssignmentTypeName FROM CaseAttorney INNER JOIN [Case] ON CaseAttorney.CaseNumber = [Case].CaseNumber INNER JOIN Attorney ON CaseAttorney.AttorneyID = Attorney.AttorneyID INNER JOIN AssignmentType ON CaseAttorney.AssignmentTypeID = AssignmentType.AssignmentTypeID WHERE (CaseGUID=@CaseGUID)"


        Dim AttorneysCcommand As SqlCommand = New SqlCommand(
          AttorneysCommandStr, strAttorneysConn)

        AttorneysCcommand.Parameters.Clear()
        AttorneysCcommand.Parameters.AddWithValue("@CaseGUID", CaseGUID)

        If strAttorneysConn.State = ConnectionState.Closed Then strAttorneysConn.Open()

        Dim AttorneysReader As SqlDataReader = AttorneysCcommand.ExecuteReader()

        If AttorneysReader.HasRows Then

            Do While AttorneysReader.Read()


                dr = dt.NewRow()


                dr("AttorneyGUID") = AttorneysReader("AttorneyGUID")
                dr("DateAssigned") = AttorneysReader("DateAssigned")
                dr("DateUnAssigned") = AttorneysReader("DateUnAssigned")

                dr("BBO") = AttorneysReader("BBO")


                dr("FirstName") = AttorneysReader("FirstName")
                dr("MiddleName") = AttorneysReader("MiddleName")
                dr("LastName") = AttorneysReader("LastName")

                dr("AttorneyName") = AttorneysReader("LastName") & ", " & AttorneysReader("FirstName")

                dr("AssignmentTypeName") = AttorneysReader("AssignmentTypeName")



                dt.Rows.Add(dr)

            Loop

        End If

        If strAttorneysConn.State = ConnectionState.Open Then strAttorneysConn.Close()

        Return dt

    End Function



    Public Shared Function getClientInformation(ByVal CaseGUID As Guid) As DataTable

        'Dim ClientGUID As Guid = New Guid("d3e3116e-0f92-44f2-9a1a-7627d202b721")

        Return CPCSClients.getClientDetails(CPCSClients.getClientGUID(CaseGUID))

    End Function


    Public Shared Function getCaseParticipants(ByVal CaseGUID As Guid) As DataSet



        Return DB.RetrieveDataSet("SELECT DISTINCT Participant.FirstName, Participant.MiddleName, Participant.LastName, Participant.CaseNumber, Participant.DOB, Role.RoleName, [Case].CaseGUID FROM Participant INNER JOIN Role ON Participant.RoleID = Role.RoleID INNER JOIN [Case] ON Participant.CaseNumber = [Case].CaseNumber WHERE [Case].CaseGUID='" & CaseGUID.ToString & "';")



    End Function



    Public Shared Function getCaseSchedule(ByVal CaseGUID As Guid) As DataSet

        Return DB.RetrieveDataSet("SELECT DISTINCT Schedule.ScheduleID, Schedule.CaseNumber, Schedule.JurySession, Schedule.Note, Schedule.DateAndTime, Event.EventName, EventType.EventTypeName, [Case].CaseGUID, Attorney.AttorneyGUID, Attorney.FirstName, Attorney.LastName FROM Schedule INNER JOIN Event ON Schedule.EventID = Event.EventID INNER JOIN EventType ON Event.EventTypeID = EventType.EventTypeID INNER JOIN [Case] ON Schedule.CaseNumber = [Case].CaseNumber INNER JOIN Attorney ON Schedule.AttorneyID = Attorney.AttorneyID WHERE [Case].CaseGUID='" & CaseGUID.ToString & "' ORDER BY Schedule.DateAndTime DESC;")



    End Function






End Class
