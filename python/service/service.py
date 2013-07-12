#! /usr/bin/env python

import argparse, sys, os
from launchctl import *


parser = argparse.ArgumentParser(description='A service manager for loco-dev')
parser.add_argument('process', help='The process to manage', type=str)
parser.add_argument('action', help='[start|stop|status|debug|help]', type=str,
                    nargs='?', default='help')
parser.add_argument('params', nargs=argparse.REMAINDER)
args = parser.parse_args()


CORE_METHODS = [
    'start',
    'stop',
    'restart',
    'status',
]


action = args.action
service = get_service(args)


if action == 'help':
    parser.print_help()
    sys.exit(os.EX_OK)


if service is None:
    print 'No service found for: {}'.format(args.process)
    sys.exit(os.EX_DATAERR)


if action is None:
    print 'No action defined.'
    parser.print_help()
    sys.exit(os.EX_DATAERR)


try:
    plist_json = read_plist(service)
    # print plist_json
    
    if action == 'debug':
        command_debug(plist_json)
    elif action == 'start':
        launchctl_start(plist_json.Label)
    elif action == 'stop':
        launchctl_stop(plist_json.Label)
    elif action == 'status':
        print 'status'
    
except:
    print 'An error has occurred: {}'.format(sys.exc_info()[0])
    sys.exit(os.EX_SOFTWARE)


sys.exit(os.EX_OK)