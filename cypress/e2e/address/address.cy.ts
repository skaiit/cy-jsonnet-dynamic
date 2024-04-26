import * as testInfo from "@fixtures/testDefinition/address/address.json";
before(() => {
  cy.fixture("testData/address/address.json").as("testData");
});
describe("Cypress Dynamic Tests Positive Scenario Examples", () => {
  testInfo.positiveScenarios.forEach((testMetaData, index) => {
    it(testMetaData.testDefinition.scenario, { tags: testMetaData.testDefinition.tags }, function (data: any = this.testData.positiveScenarios[index].testData) {
      expect(true).equals(true);
      // Add your test logic here
      console.log(data);
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