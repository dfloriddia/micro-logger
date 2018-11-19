pipeline 
{
    agent 
    {
        dockerfile true
    }

    environment 
    {


        BackenDist='true'
        DockerBuildArgs="--build-arg app=${env.GitRepo}"
        Dockerfile=''
        DockerImage='true'
        DockerLatestImage=''
        DockerRepositoryPWD='Stronzio38'
        DockerRepositoryUser='ccnetmicroarea'
        DockerTaggedImage=''
        FrontendDist='true'
        GitBranch=''
        GitRepo='micro-logger'
        LocalGitRepoDirectory=''
        OutputDirectory=''
        Solution='MicroLogger'
        SolutionDirectory=''
        StateDirectory=''
        System32=''
        Tag=''
        Version=''
        VsSolutionFile=''

            }
   stages 
   {
 
       stage ('Dotnet Build') 
       {
 
           steps 
           {
           bat "dotnet build --configuration Release"
           }
 
       }

       stage ('Publish') 
       {
 
           steps 
           {
           bat "dotnet publish ${env.VsSolutionFile} -c Release -o ${env.OutputDirectory} -p:Version=${env.Version},AssemblyVersion=${env.Version}"
           }
 
        }

        stage ('npm install') 
       {
 
           steps 
           {
           bat "npm install"
           bat "ng build --output-path ${env.OutputDirectory}"
           }
 
        }

  
        stage('Build image')
         {
            steps 
            {
                echo 'Build del micro_logger'
                sh "docker build -f ${env.Dockerfile} ${env.DockerBuildArgs} -${env.DockerTaggedImage}  ${env.OutputDirectory}"
                
            }
         }

         stage('Docker login')
         {
            steps
            {
                sh "docker login --username ${env.DockerRepositoryUser} --password ${env.DockerRepositoryPWD}"
            } 
         }

         stage('Docker Push')
         {
            steps
            {
                sh "docker push ${env.DockerTaggedImage}"
            } 
         }

         stage('RegistryDocker Tag')
         {
            steps
            {
                sh "docker tag ${env.DockerTaggedImage} ${env.DockerLatestImage}"
            } 
         }

         stage('Git Tag')
         {
            steps
            {
                sh "git tag -a m 'Ccnet tag on successfully build for version ${env.tag}' ${env.tag}"
                sh "git push --tags"
            } 
         }
    }
}

 




        
            
  




        
            
  

 




        
            
  
