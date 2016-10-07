using DeployR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DotNetConsumeRWS
{
    class Program
    {
        static void Main(string[] args)
        {

            // 1. Establish a connection to DeployR.
            String deployrEndpoint = "http://138.91.186.131:8050/deployr";
            RClient rClient = RClientFactory.createClient(deployrEndpoint);

            //Authenticate
            RAuthentication authToken = new RBasicAuthentication("testuser", "Windows@123456");
            RUser rUser = rClient.login(authToken);

            //
            // 2. Execute an analytics Web service based on a repository-managed
            RScriptExecution exec = rClient.executeScript("DeployR - ReadCSV", "root", "testuser", "");
            // 3. Retrieve the analytics Web service execution results.
          
            String console = exec.about().console;
            List<RProjectResult> plots = exec.about().results;
            List<RProjectFile> files = exec.about().artifacts;
            List<RData> objects = exec.about().workspaceObjects;
        }
    }
}
