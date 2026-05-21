import polars as pl
from huggingface_hub import hf_hub_download
from helpers.strategy.download.base_dowloader import BaseDownloader

class HuggingFaceDownloader(BaseDownloader):
    def _validate(self) -> None:
        if not self.id:
            raise ValueError("id is required")
        if not self.path:
            raise ValueError("path is required")

    def _save_to_parquet(self, file_path: str) -> None:
        pl.scan_parquet(file_path).collect().write_parquet(self.path)

    def _download(self) -> None:
        file_path = hf_hub_download(
            repo_id=self.id, 
            filename=self.kwargs.get("file_name"), 
            repo_type="dataset"
        )

        self._save_to_parquet(file_path)
        
