/* 3000userlogin.c */
/* version 0.1 */

#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <pwd.h>
#include <shadow.h>
#include <string.h>
#include <crypt.h>

int main(int argc, char *argv[])
{
        int result;
        char *shell_argv[3];
        char *username, *s, *salt, full[128], *index, *param, computed[128], entered[128];
        extern char **environ;
        struct spwd *sp_entry;
	struct passwd *pw_entry;
                
        if (argc < 2) {
                fprintf(stderr, "Usage: %s <username>\n", argv[0]);
                exit(-1);
        }

        printf("uid=%d, euid=%d, gid=%d, egid=%d\n",
               getuid(), geteuid(), getgid(), getegid());

        username = argv[1];
        
        pw_entry = getpwnam(username);
	sp_entry = getspnam(username); 
        if (pw_entry == NULL || sp_entry == NULL) {
                fprintf(stderr, "Could not find user %s.\n", username);
                exit(-2);
        }
                      
	memcpy(full, sp_entry->sp_pwdp, strlen(sp_entry->sp_pwdp)+1); 
	index = strtok(sp_entry->sp_pwdp, "$"); // get the algorithm index
	param = strtok(NULL, "$");
	salt = strtok(NULL, "$"); 

	s = fgets(entered, 128, stdin); //read the user typed password
	
	snprintf(computed, sizeof(computed), "$%s$%s$%s", index, param, salt);
	entered[strcspn(entered, "\r\n")] = 0;
	
	if(strncmp(full, crypt(entered, computed), strlen(full))) {
		fprintf(stderr, "authentication failed.\n");
		exit(-2);
	}
	
        result = setgid(pw_entry->pw_gid);
        if (result != 0) {
                fprintf(stderr, "Failed to change to gid %d\n",
                        pw_entry->pw_gid);
                exit(-3);
        }

        result = setuid(pw_entry->pw_uid);
        if (result != 0) {
                fprintf(stderr, "Failed to change to uid %d\n",
                        pw_entry->pw_uid);
                exit(-4);
        }

        result = chdir(pw_entry->pw_dir);
        if (result != 0) {
                fprintf(stderr, "Failed to change to home dir %s\n",
                        pw_entry->pw_dir);
                exit(-5);
        }

        shell_argv[0] = "bash";
        shell_argv[1] = "--login";
        shell_argv[2] = NULL;

        clearenv();
        setenv("USERNAME", pw_entry->pw_name, 1);
        setenv("PATH", "/usr/bin:/bin", 1);
        setenv("SHELL", "/bin/bash", 1);
        setenv("HOME", pw_entry->pw_dir, 1);
        setenv("COMP3000", "yes", 1);
        
        execve("/bin/bash", shell_argv, environ);
     
        fprintf(stderr, "Failed to exec bash\n");
        return -6;
}
