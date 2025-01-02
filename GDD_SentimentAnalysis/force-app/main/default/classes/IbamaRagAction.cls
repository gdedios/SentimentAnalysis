public with sharing class IbamaRagAction {

    @InvocableMethod(Label='Laws check Doc Search' description='Suggest what are the best laws to be aligned with Case' )
     public static List<Response>  invoke (List<Request> requests) {
         
        Request request = requests[0];

        List<Response> responses = new List<Response>();

        Response out = new Response();

        String RAGJson = IbamaSearchContext2.search('Desmatamento').toString();
        
        out.results = Summarise(request.input, RAGJson);

        responses.add(out);
         
/*TEST 1 to get the APEX running user information saved within a contact to check outside of the developer console in real time
 * what user is doing the magic STARTS HERE
        
		// Get the running user ID
        String runningUserId = UserInfo.getUserId();
        // Get the running user language
        String runningUserLanguage = UserInfo.getLanguage();
        
        // Create a new Contact
        Contact newContact = new Contact();
        newContact.FirstName = 'This is';
        newContact.LastName = 'a Test';
        newContact.AccountId = '001am00000gEUviAAG';
        newContact.Title = runningUserId;
        newContact.Department = runningUserLanguage;
        // Insert the new Contact
        insert newContact;
		System.debug(UserInfo.getlanguage());
   		System.debug('User ID:' + UserInfo.getUserId());


TEST FINISHES HERE*/

/*TEST 2 to use within the Execute anonymous window in order to see all the System.debug happening in the code STARTS HERE
        //Create Request
        IbamaRagAction.Request request = new IbamaRagAction.Request();
        request.input = 'Desmatamento';
            
        List<IbamaRagAction.Request> requests = new List<IbamaRagAction.Request>();
        requests.add(request);
        //Create Responses
        List<IbamaRagAction.Response> responses = new List<IbamaRagAction.Response>();
        
        responses = IbamaRagAction.invoke(requests);
        System.debug('Responses are:' + responses);
        
TEST 2 FINISHES HERE*/

        return responses;
     }
    
    

     public static string summarise(string input, string results) {
        
 		      String prompt = 'Generate insights into suggested next actions for the Service Rep based on:  "' + input + '" question.  Use this information to ';
        prompt +=       'bring insights from the brazilian laws and the rest of the documentation related to the customer questions. The results from the documents and Laws are: ' + results ;
        prompt +=       'Use only infos provided by the documents, dont invent them.  If there are no matching results, say so.';
        prompt +=       'Use only laws that are include in the document dont use external assets.';
        prompt +=       'Avoid to generate too many suggestions.  The suggestions need to be very relevant to the questions.';
        prompt +=       'Also include a brief description of how/why the result matches the search term, if possible.';
        prompt +=       'Include the law or laws that were used for the results.';
        prompt +=       'The class of the customer should be highlighted in bold.';
        prompt +=       'highlights the document part that you found';
        prompt +=       'use no more than 500 characters';
         
         LLMService.LLMOptions options = new LLMService.LLMOptions(); 

        return LLMService.generate(prompt, options);

    }

    //The Actual Request
    public class Request {
        @InvocableVariable(Label='Problems or dispute' required=false description='The case subject, or description of the problem or dispute..')
        public String input;

    }

     public class Response {
        @InvocableVariable(Required=false label='Results' description='Insights of the next actions and laws to use to handle the request.')
        public String results;
    }
}