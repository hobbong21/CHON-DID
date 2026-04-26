package com.chon.api.service.impl;

import com.chon.api.entity.CategoryEntity;
import com.chon.api.entity.SubLevelEntity;
import com.chon.api.model.category.SubLevelListResModel;
import com.chon.api.repository.CategoryRepository;
import com.chon.api.repository.SubLevelRepository;
import com.chon.api.service.CategoryService;
import com.chon.api.utils.mapper.ModelMapperUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private SubLevelRepository subLevelRepository;

    @Override
    public List<CategoryEntity> categoryList(String code) {
        return categoryRepository.findByCodeOrderByDisplayOrder(code);
    }

    public List<SubLevelListResModel> subLevelList(String code) {
        List<SubLevelListResModel> subLevelListResModels = new ArrayList<>();
        List<SubLevelEntity> subLevelEntities = subLevelRepository.findAllByLevelCode(code);

        for (SubLevelEntity entity : subLevelEntities) {
            SubLevelListResModel resModel = ModelMapperUtils.toObject(entity, SubLevelListResModel.class);
            subLevelListResModels.add(resModel);
        }

        return subLevelListResModels;
    }

    @Override
    public String generateBlockHeight() {
        CategoryEntity categoryEntity = categoryRepository.findByCode("BLOCK_HEIGHT");
        Long blockHeight = categoryEntity.getDisplayOrder() + 1;
        categoryEntity.setDisplayOrder(blockHeight);
        categoryRepository.save(categoryEntity);
        return String.valueOf(blockHeight);
    }
}
