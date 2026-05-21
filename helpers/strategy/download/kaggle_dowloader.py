from kaggle.api.kaggle_api_extended import KaggleApi
from helpers.strategy.download.base_dowloader import BaseDownloader


api = KaggleApi()
api.authenticate()


class KaggleDownloader(BaseDownloader):
    def __init__(
        self, url: str = "", id: str = "", path: str = "", *args, **kwargs
    ) -> None:
        super().__init__(url, id, path, *args, **kwargs)

    def _validate(self) -> None:
        if not self.id:
            raise ValueError("Need provide id for kaggle dataset.")
        if not self.path:
            raise ValueError("Need provide path for download.")

    def _download(self) -> None:
        api.dataset_download_files(self.id, path=self.path, **self.kwargs)
