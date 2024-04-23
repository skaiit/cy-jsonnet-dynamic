import * as testInfo from "@fixtures/testDefinition/person.json";
before(() => {
  cy.fixture("testData/person.json").as("testData");
});
describe("Cypress Dynamic Tests Positive Scenario Examples", () => {
  testInfo.positiveScenarios.forEach((testMetaData, index) => {
    it(testMetaData.testDefinition.scenario, { tags: testMetaData.testDefinition.tags }, function (data: any = this.testData.positiveScenarios[index].testData) {
      expect(true).equals(true);
      // Add your test logic here
      console.log(data.person);
    });
  });
});
describe("Cypress Dynamic Tests Negative Scenario Examples", () => {
  testInfo.negativeScenarios.forEach((testMetaData, index) => {
    it(testMetaData.testDefinition.scenario, { tags: testMetaData.testDefinition.tags }, function (data: any = this.testData.negativeScenarios[index].testData) {
      expect(true).equals(true);
      // Add your test logic here
      console.log(data.person);
    });
  });
}); 