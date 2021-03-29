namespace CustomerNotification.BusinessRules
{
    public interface ICustomerDetails
    {
        string DataType { get; set; }
        string Email { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        string PreferredChannel { get; set; }
        string UserId { get; set; }
    }
}