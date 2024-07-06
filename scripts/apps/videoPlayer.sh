videoPlayer() {
    echo "Select video players to install (separated by spaces, or '0' to skip): "
    echo "Options: 1. VLC 2. MPV 3. None"

    read -r -a videos

    for video_index in "${videos[@]}"; do
        case $video_index in
        1)
            echo "** Installing VLC media player...**"
            flatpak install flathub org.videolan.VLC
            echo "VLC installed successfully."
            ;;
        2)
            echo "** Installing MPV media player...**"
            flatpak install flathub io.mpv.Mpv
            echo "MPV installed successfully."
            echo "MPV installed successfully."
            ;;
        3)
            echo "Skipping video player installation."
            return
            ;;
        0)
            echo "Skipping video player installation."
            return
            ;;
        *)
            echo "Invalid video player selection: $video_index"
            ;;
        esac
    done
}
