from subprocess import call, check_output
from glob import glob
import plistlib
import os
import sys
import json

launchctl = '/bin/launchctl'
launch_daemons = '/Library/launchDaemons'


def launchctl_stop(service, force=False):
    """
    Call launchd to stop a service

    @todo exception handling, or define a last_error retrieval method
    @return bool
    """
    flag = '-wF' if force else '-w'
    stopped = call([ 'sudo', launchctl, 'stop', service ])
    return call([ 'sudo', launchctl, 'unload', flag, '{}/{}.plist'.format(launch_daemons, service) ])
    
    
def launchctl_start(service, force=False):
    """
    Call launchd to start a service
    @todo exception handling, or define a last_error retrieval method
    """
    flag = '-wF' if force else '-w'
    return call([ 'sudo', launchctl, 'load', flag, '{}/{}.plist'.format(launch_daemons, service) ])


def get_services():
    """
    List available plist files
    """
    services = glob('/Library/LaunchDaemons/*.plist')
    services += glob('/Library/LaunchAgents/*.plist')
    
    return services


def get_service(args):
    """
    Fish a service out of the list of available services
    @return string
    """
    services = get_services()
    
    service = None
    
    for i in services:
        if args.process in i:
            service = i
            break
    
    return service


def read_plist(plist_file):
    """
    Read a plist file and parse to json
    """
    return plistlib.readPlist(plist_file)


def get_environment(param):
    """
    Get the environment params under which to run from launchd
    """
    return check_output(['sudo', launchctl, 'getenv', param]).strip()


def command_debug(plist_json):
    """
    Parse and run a program from the plist arguments
    """

    # this is a bit heavy handed, but not horrible
    program_args = ['sudo']

    if 'Program' in plist_json:
        program_args.extend([plist_json.Program])
    else:
        program_args.extend(plist_json.ProgramArguments)

    # program_env = dict()
    # program_env['PATH'] = get_environment('PATH')

    if 'WorkingDirectory' in plist_json:
        working_directory = plist_json.WorkingDirectory
    else:
        working_directory = '/'

    print program_args

    os.chdir(working_directory)
    call(program_args)

    sys.exit()
    
def command_dump(plist_json):
    """
    Dump the raw json plist data
    """
    print json.dumps(plist_json, indent=4)