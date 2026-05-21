import gdown
from typing import Literal
from .base_dowloader import BaseDownloader


class GoogleDriverDownloader(BaseDownloader):
    def __init__(
        self,
        url: str = "",
        path: str = "",
        id: str = None,
        item_type: Literal["file", "folder"] = "",
        *args,
        **kwargs,
    ) -> None:
        super().__init__(url, id, path, *args, **kwargs)
        self.item_type = item_type

    def _validate(self) -> None:
        if not self.path:
            raise ValueError("Need provide path for download.")
        if self.item_type is None:
            raise ValueError("type is required")
        if self.item_type not in ("file", "folder"):
            raise ValueError("type must be 'file' or 'folder'")
        if self.item_type == "folder":
            if not self.url and not self.id:
                raise ValueError("Need provide url or id for folder download.")
        else:
            if not self.url:
                raise ValueError("Need provide url for file download.")

    def _download_folder(self) -> None:
        if self.url:
            gdown.download_folder(
                url=self.url, output=self.path, *self.args, **self.kwargs
            )
            return
        if self.id:
            gdown.download_folder(
                id=self.id, output=self.path, *self.args, **self.kwargs
            )
            return

    def _download_file(self) -> None:
        gdown.download(url=self.url, output=self.path, *self.args, **self.kwargs)

    def _download(self) -> None:
        if self.item_type == "folder":
            self._download_folder()
        else:
            self._download_file()
