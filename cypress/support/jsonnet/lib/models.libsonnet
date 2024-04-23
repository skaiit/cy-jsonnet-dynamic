{
  Person(firstName=std.native("fake")("{firstname}"),lastName=std.native("fake")("{lastname}"), ssn=std.native("fake")("{ssn}"), address={})::
    {
      person: {
        firstName: firstName,
        lastName: lastName,
        ssn:ssn,
        address: address,
      },
    },
  Address(city='bellevue', state=std.native('fake')('{state}'))::
    {
      city: city,
      state: state,
    },
}