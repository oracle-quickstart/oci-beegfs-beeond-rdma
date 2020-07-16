variable "save_to" {
    default = ""
}

data "archive_file" "generate_zip" {
  type        = "zip"
  output_path = (var.save_to != "" ? "${var.save_to}/beegfs_beeond_rdma.zip" : "${path.module}/dist/beegfs_beeond_rdma.zip")
  source_dir = "../"
excludes    = [".gitignore" , "terraform.tfstate", "terraform.tfvars.template", "terraform.tfvars", "provider.tf", ".terraform", "images" , "orm" , ".git" , "localonly.ior_mpiio_setup.tf" , "terraform.tfstate.backup" , "passwordless_ssh.sh" ,  "scripts/passwordless_ssh.sh" , "scripts/ior_install.sh" , "scripts/restart.sh" , "RM_Mktplace_public_oci-beegfs-beeond.xcworkspace" , "mdtest_perf_results.txt" , "questions-4-beegfs-expert.txt" , "scripts/run_iozone_benchmark.sh" , "scripts/iozone_install.sh" ,  "localonly.iozone_setup.tf" , "local_only" ]
}

