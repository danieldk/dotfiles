#!/usr/bin/python
import sys, re, subprocess
def get_keychain_pass(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'account': account,
        'server': server,
    }
    command = "%(security)s -v %(command)s -g -a %(account)s -s %(server)s" % params
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        sys.exit(1)

    print get_keychain_pass(sys.argv[1], sys.argv[2])
