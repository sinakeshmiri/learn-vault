# ACL:
  ### HCL (Hashicorp Configuration Language):
  - json compatiable
  sample  policy:
  
  ```
  path "sys/auth/*"{
    capabilities = ["create","update","delete","sudo"]
  }
  ```
  
  only list?
  
  <kbd>
  <img src=https://user-images.githubusercontent.com/72389059/224930221-b5e2f3f6-1bac-4d25-b67f-c503655b1a98.png>
  </kbd>




  default policy is to **deny**
   
  sudo allows you to access all under root
  
  
  
  
  enable secret engine
  
   `vault secrets enable -path=secret/ kv`
   
  write a policy
    
    path "secret/data/training data"{
      capabilites = ["create,"read"]
    }
  
   apply policy
   
    `vault policy write testpolicy testpolicy.hcl`
   
   
   create token with a policy
   
    `vault token create -policy="testpolicy"`
    
    
   login with it!
   
    `vault login`
   
   try it!
    
    `vault  kv put  secret/some_key key=some_key`
      |-  fails!
      
    `vault kv put secret/data/trainig_data password="FFFFF"`
___
   an other one:
     
     ```
     vault  login
     vault token  create -policy="read_data"
     vault token capablities secret/data/trainig_data
     vault kv put  secret/data/trainig_data key="val"
     ```
     
     
# SENTINEL:
  - enterprise level
  - condtions are available
  
  ```
  import "<lib>"
  <var> = <val>
  main  = rule{
      <conditions_to_evaluate>
    }
  ```
  
  sample.sentinel
  ```
  import "time"
  workdays = rule{
    time.now.weekday > 0 and  time.now.weekday < 6
  }
  workhours = rule{
    time.now.hour > 0 and  time.now.hour < 16
  }
  main = rule {
    workdays and workhours
  }
  ```
  
  test policy:
    - setup hashicorp emulator
    
    ```
    # mkdir  -p  test/our-policy
    # nano test/our-policy/fail.json
    # nano test/our-policy/success.json
    # nano our-policy.sentinel
    # sentinel test
    
    ```
  <kbd>
  <img src=https://user-images.githubusercontent.com/72389059/224937074-62d8eb64-233f-4639-bf24-633eb59e7f0e.png alt="fail" width="300" height="200">
  <img src=https://user-images.githubusercontent.com/72389059/224937294-7b949119-c067-4982-9279-1b94496fc689.png alt="success" width="300" height="200">
 <img src=https://user-images.githubusercontent.com/72389059/224937163-377e0722-05f2-455e-9ed8-8f22f94bffbb.png alt="policy" width="350" height="200">
  </kbd>

