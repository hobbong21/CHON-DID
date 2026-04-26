package com.chon.api.service;

import com.chon.api.entity.CategoryEntity;
import com.chon.api.model.category.SubLevelListResModel;

import java.util.List;

public interface CategoryService {
    List<CategoryEntity> categoryList(String code);

    List<SubLevelListResModel> subLevelList(String code);

    String generateBlockHeight();
}
