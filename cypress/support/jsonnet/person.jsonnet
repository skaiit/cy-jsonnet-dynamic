local model = import './lib/models.libsonnet';
local utils = import './lib/utils.libsonnet';
local DynamicTest(definition={}, data={}) = {
  testDefinition: definition,
  testData: if std.extVar('generateTestData') == 'true' then data else {},
};
{
  positiveScenarios: [
    // Person
    DynamicTest(
      definition=utils.testDefinition(fileName=std.thisFile, scenario='Verify person entity can be created with empty address', tags=['sanity', 'person']),
      data=model.Person()
    ),
    DynamicTest(
      definition=utils.testDefinition(fileName=std.thisFile, scenario='Verify person is created with name=joe', tags=['sanity', 'regression']),
      data=model.Person(firstName='joe', address=model.Address())
    ),
  ],
  negativeScenarios: [
    DynamicTest(
      definition=utils.testDefinition(fileName=std.thisFile, scenario='Verify person failed with empty firstname', tags=['regression', 'sanity']),
      data=model.Person(firstName='', address=model.Address(city=std.native('fake')('{city}')))
    ),
    DynamicTest(
      definition=utils.testDefinition(fileName=std.thisFile, scenario='Verify person failed when ssn in null or empty', tags=['regression']),
      data=model.Person(ssn='', address=model.Address())
    ),
  ],
}
