{
  Person(firstName=std.native('fake')('{firstname}'), lastName=std.native('fake')('{lastname}'), ssn=std.native('fake')('{ssn}'), address={})::
    {
      person: {
        firstName: firstName,
        lastName: lastName,
        ssn: ssn,
        address: if std.objectHas(address, 'address') then address.address else address,
      },
    },
  Address(city='bellevue', state=std.native('fake')('{state}'))::
    {
      address: {
        city: city,
        state: state,
      },
    },
}
