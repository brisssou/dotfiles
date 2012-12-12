import readline, rlcompleter
readline.parse_and_bind("tab: complete")

def save_console(file_name):
    readline.write_history_file(file_name)
console_save = save_console
