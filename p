import time

def print_progress_bar(bar_size: int, fraction_downloaded: float, is_replaceable: bool) -> None:
    """ Prints a progress bar of given size with given progress 
        Must have 0 <= fraction_downloaded <= 1.
        Parameters
            bar_size: the number of characters to fill in
            fraction_downloaded: the fraction of the file downloaded
            is_replaceable: True if the printed line should end with '\r', '\n' otherwise.
    """    
    end_char = None
    if is_replaceable:
        end_char = '\r'
    else:
        end_char = '\n'
    progress = int(fraction_downloaded * bar_size)
    print("{:3.0f}".format(100*fraction_downloaded) + '% ['+ '*'*progress + ' '*(bar_size-progress)+']', flush=True, end=end_char)

if __name__ == "__main__":
    time_between_updates = 0.1 # the time in seconds between two refresh of the bar
    progress_bar_size = 50
    # 56kbps = 0.007 MB per second
    download_speed = 0.007 # in MB per second
    
    progress_between_updates = download_speed * time_between_updates #in MB

    file_size = float(input("Size (in MB) of the file: "))
    
    size_downloaded = 0
    while size_downloaded < file_size:
        time.sleep(time_between_updates)
        size_downloaded = min(file_size, size_downloaded + progress_between_updates)
        fraction_downloaded = size_downloaded / file_size
        print_progress_bar(progress_bar_size, fraction_downloaded, True)
