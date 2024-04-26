local model = import '../lib/models.libsonnet';
local utils = import '../lib/utils.libsonnet';
local DynamicTest(definition={}, data={}) = {
  testDefinition: definition,
  testData: if std.extVar('generateTestData') == 'true' then data else {},
};
{
  positiveScenarios: [
    // Person
    DynamicTest(
      definition=utils.testDefinition(fileName=std.thisFile, scenario='Create default Address entity', tags=['sanity', 'adress']),
      data=model.Address()
    ),


  ] + [  
    DynamicTest(
      definition=utils.testDefinition(fileName=std.thisFile, scenario='Crete address with city=' + city, tags=['regression']),
      data=model.Address(city=city)
    )
    for city in ['Bellevue', 'Seattle', 'Redmond'] // example for using static array for multiple test
  ],

  negativeScenarios: [
    DynamicTest(
      definition=utils.testDefinition(fileName=std.thisFile, scenario='Verify address with empty state', tags=['regression', 'sanity']),
      data=model.Address(state='')
    ),
    DynamicTest(
      definition=utils.testDefinition(fileName=std.thisFile, scenario='Verify address with empty string value', tags=['sanity']),
      data=model.Address(state='', city='')
    ),
  ],
}
