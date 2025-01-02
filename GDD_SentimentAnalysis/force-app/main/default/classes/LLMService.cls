public with sharing class LLMService {
    
    public static String generate(String prompt, LLMOptions options){

        ConnectApi.EinsteinLlmGenerationsInput generationsInput = new ConnectApi.EinsteinLlmGenerationsInput();
        generationsInput.promptTextorId = prompt;
        generationsInput.provider = options.provider;
        generationsInput.additionalConfig = new ConnectApi.EinsteinLlmAdditionalConfigInput();
        generationsInput.additionalConfig.maxTokens = options.maxTokens;
        generationsInput.additionalConfig.model = options.model;
        generationsInput.additionalConfig.applicationName = options.applicationName;

        System.debug('LLM Service Prompt: ' + prompt);

        ConnectApi.EinsteinLLMGenerationsOutput generationsOutput = ConnectApi.EinsteinLLM.generateMessages(generationsInput);
        ConnectApi.EinsteinLLMGenerationItemOutput response = generationsOutput.generations[0];

        System.debug('LLM Service Response: ' + response.text);
        System.debug('LLM Service Response text length: ' + response.text.length());
        System.debug('LLM Actual Responses: ' + generationsOutput.generations.size());

        return response.text;

    }

    public class LLMOptions {
        public String model = 'gpt-4-turbo-preview';
        public String applicationName = 'PromptTemplateGenerationsInvocable';
        public String provider = 'OpenAI';
        public Integer maxTokens = 4096;
    }
}