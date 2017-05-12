Public Class Date_Ranges



    Public Structure DateRange
        Public Property Start() As DateTime
            Get
                Return m_Start
            End Get
            Set
                m_Start = Value
            End Set
        End Property
        Private m_Start As DateTime
        Public Property [End]() As DateTime
            Get
                Return m_End
            End Get
            Set
                m_End = Value
            End Set
        End Property
        Private m_End As DateTime
    End Structure

    Public Shared Function ThisYear([date] As DateTime) As DateRange
        Dim range As New DateRange()

        range.Start = New DateTime([date].Year, 1, 1)
        range.[End] = range.Start.AddYears(1).AddSeconds(-1)

        Return range
    End Function

    Public Shared Function LastYear([date] As DateTime) As DateRange
        Dim range As New DateRange()

        range.Start = New DateTime([date].Year - 1, 1, 1)
        range.[End] = range.Start.AddYears(1).AddSeconds(-1)

        Return range
    End Function

    Public Shared Function ThisMonth([date] As DateTime) As DateRange
        Dim range As New DateRange()

        range.Start = New DateTime([date].Year, [date].Month, 1)
        range.[End] = range.Start.AddMonths(1).AddSeconds(-1)

        Return range
    End Function

    Public Shared Function LastMonth([date] As DateTime) As DateRange
        Dim range As New DateRange()

        range.Start = (New DateTime([date].Year, [date].Month, 1)).AddMonths(-1)
        range.[End] = range.Start.AddMonths(1).AddSeconds(-1)

        Return range
    End Function

    Public Shared Function ThisWeek([date] As DateTime) As DateRange
        Dim range As New DateRange()

        range.Start = [date].[Date].AddDays(-CInt([date].DayOfWeek))
        range.[End] = range.Start.AddDays(7).AddSeconds(-1)

        Return range
    End Function

    Public Shared Function LastWeek([date] As DateTime) As DateRange
        Dim range As DateRange = ThisWeek([date])

        range.Start = range.Start.AddDays(-7)
        range.[End] = range.[End].AddDays(-7)

        Return range
    End Function

    Public Shared ReadOnly Property minDateRange As Date = Now.AddYears(-20).Date
    Public Shared ReadOnly Property maxDateRange As Date = Now.Date
    Public Shared ReadOnly Property defaultStartDate As Date = Now.AddYears(-1).Date
    Public Shared ReadOnly Property defaultEndDate As Date = Now.Date


End Class
