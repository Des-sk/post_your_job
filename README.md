models
-recruiter
    * has many job posts, has many clients
    ** name
    ** email

-job_post
    * belongs to a recruiter, belongs to a client
    forieng key

    ** title
    ** requirements
    ** salary
    ** recruiters email


-Client
    belongs to a recruiter, has many jobs posts THROUGH a Recruiter
    forieng key

    **name 

