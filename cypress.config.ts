import { interpretJsonnet } from "cy-jsonnet";
import { defineConfig } from "cypress";
import * as path from 'path';
const jsonnetFolder: string = "jsonnet";
const testDefinitionFolder: string = "testDefinition";
const testDataFolder: string = "testData";
let jsonnetPath = path.join('./cypress/support/', jsonnetFolder);
let testDefinitionPath = path.join('./cypress/fixtures/', testDefinitionFolder);
let testDataPath = path.join('./cypress/fixtures/', testDataFolder);
export default defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      on("before:run", (details) => {
        interpretJsonnet(jsonnetPath, '**/*.jsonnet', testDefinitionPath, false);
      });
      on("before:spec", (spec) => {
        interpretJsonnet(jsonnetPath, `**/*${spec.fileName}*.jsonnet`, testDataPath, true);
      });
      return config;
    },
    experimentalRunAllSpecs: true,
    experimentalInteractiveRunEvents: true
  },
});