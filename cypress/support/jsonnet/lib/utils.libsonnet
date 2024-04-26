{
  testDefinition(fileName, scenario, tags=[])::
    {
      scenario: scenario,
      testIdentifier: std.md5(fileName + scenario),
      tags: tags + [self.testIdentifier],
    },
}
