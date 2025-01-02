public class IbamaSearchContext2 {
    
    public static List<Object> search(String searchTerm){

        ConnectApi.CdpQueryInput input = new ConnectApi.CdpQueryInput();

        String escapedInputDetails = searchTerm.replace('\'', '');
        
        String query = 'SELECT v.score__c Score__c, c.chunk__c Chunk__c from vector_search(TABLE(news3demo_index__dlm),\'' + escapedInputDetails + '\',\'\', 1) v join news3demo_chunk__dlm c on v.RecordId__c = c.RecordId__c ORDER BY 1 DESC LIMIT 10';
        
        input.sql = query;

        ConnectApi.CdpQueryOutput output = ConnectApi.CdpQuery.queryANSISql(input); 
        
        /*
        Map<String, Object> m = (Map<String, Object>) System.JSON.deserializeUntyped(output.data);
        String resultsss = m.get('Chunk__c');
        System.debug('VectorDB Chunk: ' + resultsss);
        System.debug('VectorDB response size: ' + output.data.size());
        System.debug('VectorDB response that I\'m doing toString(): ' + output.data);
*/
        return output.data;    

    }
}