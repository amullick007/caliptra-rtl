//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// SPDX-License-Identifier: Apache-2.0
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    environment package that will run on the host simulator.
//
// CONTAINS:
//     - <soc_ifc_configuration.svh>
//     - <soc_ifc_environment.svh>
//     - <soc_ifc_env_sequence_base.svh>
//     - <soc_ifc_predictor.svh>
//     - <soc_ifc_scoreboard.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package soc_ifc_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import mvc_pkg::*;
  import mgc_ahb_v2_0_pkg::*;
  import rw_txn_pkg::*;
  import soc_ifc_ctrl_pkg::*;
  import soc_ifc_ctrl_pkg_hdl::*;
  import cptra_ctrl_pkg::*;
  import cptra_ctrl_pkg_hdl::*;
  import ss_mode_ctrl_pkg::*;
  import ss_mode_ctrl_pkg_hdl::*;
  import soc_ifc_status_pkg::*;
  import soc_ifc_status_pkg_hdl::*;
  import cptra_status_pkg::*;
  import cptra_status_pkg_hdl::*;
  import ss_mode_status_pkg::*;
  import ss_mode_status_pkg_hdl::*;
  import mbox_sram_pkg::*;
  import mbox_sram_pkg_hdl::*;
  import soc_ifc_reg_model_top_pkg::*;
  import qvip_ahb_lite_slave_pkg::*;
  import qvip_ahb_lite_slave_params_pkg::*;
 
  `uvm_analysis_imp_decl(_soc_ifc_ctrl_agent_ae)
  `uvm_analysis_imp_decl(_cptra_ctrl_agent_ae)
  `uvm_analysis_imp_decl(_ss_mode_ctrl_agent_ae)
  `uvm_analysis_imp_decl(_mbox_sram_agent_ae)
  `uvm_analysis_imp_decl(_ahb_slave_0_ae)
  `uvm_analysis_imp_decl(_axi_sub_0_ae)
  `uvm_analysis_imp_decl(_expected_analysis_export)
  `uvm_analysis_imp_decl(_expected_cptra_analysis_export)
  `uvm_analysis_imp_decl(_expected_ss_mode_analysis_export)
  `uvm_analysis_imp_decl(_actual_analysis_export)
  `uvm_analysis_imp_decl(_actual_cptra_analysis_export)
  `uvm_analysis_imp_decl(_actual_ss_mode_analysis_export)
  `uvm_analysis_imp_decl(_expected_ahb_analysis_export)
  `uvm_analysis_imp_decl(_expected_axi_analysis_export)
  `uvm_analysis_imp_decl(_actual_ahb_analysis_export)
  `uvm_analysis_imp_decl(_actual_axi_analysis_export)
 
  `uvm_analysis_imp_decl(_cov_soc_ifc_ctrl_ae)
  `uvm_analysis_imp_decl(_cov_soc_ifc_status_ae)
  `uvm_analysis_imp_decl(_cov_axi_ae)
  `uvm_analysis_imp_decl(_cov_cptra_ctrl_ae)
  `uvm_analysis_imp_decl(_cov_cptra_status_ae)
  `uvm_analysis_imp_decl(_cov_ahb_ae)
  `uvm_analysis_imp_decl(_cov_mbox_sram_ae)
  `uvm_analysis_imp_decl(_cov_ss_mode_ctrl_ae)
  `uvm_analysis_imp_decl(_cov_ss_mode_status_ae)

  // pragma uvmf custom package_imports_additional begin
  import axi_pkg::*;

  `include "avery_defines.svh"
  import aaxi_pkg::*;
  import aaxi_pkg_xactor::*;
  import aaxi_pkg_test::*;
  import aaxi_pll::*;
  import aaxi_uvm_pkg::*;

  import mbox_pkg::*;
  import soc_ifc_pkg::*;
  `include "caliptra_macros.svh"
  `include "caliptra_reg_defines.svh"
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/soc_ifc_env_typedefs.svh"
  `include "src/soc_ifc_env_configuration.svh"
  `include "src/soc_ifc_predictor.svh"
  `include "src/soc_ifc_scoreboard.svh"
  `include "src/soc_ifc_reg_cov_subscriber.svh"
  `include "src/soc_ifc_env_cov_subscriber.svh"
  `include "src/soc_ifc_environment.svh"
  `include "src/soc_ifc_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  typedef soc_ifc_env_configuration  soc_ifc_env_configuration_t;
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // TODO: Also declare the 'typedef'

  ///////////////////// Base Sequence - do not run /////////////////////
  typedef soc_ifc_env_sequence_base #( .CONFIG_T(soc_ifc_env_configuration_t)) soc_ifc_env_sequence_base_t;

  ///////////////////// Sequences usable from Caliptra_top /////////////////////
  /* TODO: If desired in top-level rand sequence, add this to the rand_seq_idx enum/avail_env_seqs_c constraint */
  `include "sequences/bringup/soc_ifc/soc_ifc_env_reset_sequence_base.svh"
  typedef soc_ifc_env_reset_sequence_base soc_ifc_env_reset_sequence_base_t;
  `include "sequences/bringup/soc_ifc/soc_ifc_env_bringup_sequence.svh"
  typedef soc_ifc_env_bringup_sequence soc_ifc_env_bringup_sequence_t;
  `include "sequences/bringup/soc_ifc/soc_ifc_env_rom_bringup_sequence.svh"
  typedef soc_ifc_env_rom_bringup_sequence soc_ifc_env_rom_bringup_sequence_t;
  `include "sequences/bringup/soc_ifc/soc_ifc_env_axi_user_init_sequence.svh"
  typedef soc_ifc_env_axi_user_init_sequence soc_ifc_env_axi_user_init_sequence_t;
  `include "sequences/bringup/soc_ifc/soc_ifc_env_reset_warm_sequence.svh"
  typedef soc_ifc_env_reset_warm_sequence soc_ifc_env_reset_warm_sequence_t;
  `include "sequences/bringup/soc_ifc/soc_ifc_env_reset_cold_sequence.svh"
  typedef soc_ifc_env_reset_cold_sequence soc_ifc_env_reset_cold_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_sequence_base.svh"
  typedef soc_ifc_env_mbox_sequence_base soc_ifc_env_mbox_sequence_base_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_fw_sequence.svh"
  typedef soc_ifc_env_mbox_rand_fw_sequence soc_ifc_env_mbox_rand_fw_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_real_fw_sequence.svh"
  typedef soc_ifc_env_mbox_real_fw_sequence soc_ifc_env_mbox_real_fw_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_fw_upd_sequence.svh"
  typedef soc_ifc_env_mbox_fw_upd_sequence soc_ifc_env_mbox_fw_upd_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rom_fw_sequence.svh"
  typedef soc_ifc_env_mbox_rom_fw_sequence soc_ifc_env_mbox_rom_fw_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_small_sequence.svh"
  typedef soc_ifc_env_mbox_rand_small_sequence soc_ifc_env_mbox_rand_small_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_min_sequence.svh"
  typedef soc_ifc_env_mbox_min_sequence soc_ifc_env_mbox_min_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_max_sequence.svh"
  typedef soc_ifc_env_mbox_max_sequence soc_ifc_env_mbox_max_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_medium_sequence.svh"
  typedef soc_ifc_env_mbox_rand_medium_sequence soc_ifc_env_mbox_rand_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_large_sequence.svh"
  typedef soc_ifc_env_mbox_rand_large_sequence soc_ifc_env_mbox_rand_large_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_medium_interference_sequence.svh"
  typedef soc_ifc_env_mbox_rand_medium_interference_sequence soc_ifc_env_mbox_rand_medium_interference_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_axi_user_sequence.svh"
  typedef soc_ifc_env_mbox_rand_axi_user_sequence soc_ifc_env_mbox_rand_axi_user_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_axi_user_small_sequence.svh"
  typedef soc_ifc_env_mbox_rand_axi_user_small_sequence soc_ifc_env_mbox_rand_axi_user_small_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_axi_user_medium_sequence.svh"
  typedef soc_ifc_env_mbox_rand_axi_user_medium_sequence soc_ifc_env_mbox_rand_axi_user_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_axi_user_large_sequence.svh"
  typedef soc_ifc_env_mbox_rand_axi_user_large_sequence soc_ifc_env_mbox_rand_axi_user_large_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_delay_sequence.svh"
  typedef soc_ifc_env_mbox_rand_delay_sequence soc_ifc_env_mbox_rand_delay_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_delay_small_sequence.svh"
  typedef soc_ifc_env_mbox_rand_delay_small_sequence soc_ifc_env_mbox_rand_delay_small_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_delay_medium_sequence.svh"
  typedef soc_ifc_env_mbox_rand_delay_medium_sequence soc_ifc_env_mbox_rand_delay_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_delay_large_sequence.svh"
  typedef soc_ifc_env_mbox_rand_delay_large_sequence soc_ifc_env_mbox_rand_delay_large_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_reg_axs_invalid_sequence.svh"
  typedef soc_ifc_env_mbox_reg_axs_invalid_sequence soc_ifc_env_mbox_reg_axs_invalid_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_reg_axs_invalid_small_sequence.svh"
  typedef soc_ifc_env_mbox_reg_axs_invalid_small_sequence soc_ifc_env_mbox_reg_axs_invalid_small_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_reg_axs_invalid_medium_sequence.svh"
  typedef soc_ifc_env_mbox_reg_axs_invalid_medium_sequence soc_ifc_env_mbox_reg_axs_invalid_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_reg_axs_invalid_large_sequence.svh"
  typedef soc_ifc_env_mbox_reg_axs_invalid_large_sequence soc_ifc_env_mbox_reg_axs_invalid_large_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_invalid_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_invalid_sequence soc_ifc_env_mbox_dlen_invalid_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dir_read_sequence.svh"
  typedef soc_ifc_env_mbox_dir_read_sequence soc_ifc_env_mbox_dir_read_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_overflow_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_overflow_sequence soc_ifc_env_mbox_dlen_overflow_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_overflow_small_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_overflow_small_sequence soc_ifc_env_mbox_dlen_overflow_small_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_overflow_medium_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_overflow_medium_sequence soc_ifc_env_mbox_dlen_overflow_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_overflow_large_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_overflow_large_sequence soc_ifc_env_mbox_dlen_overflow_large_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_underflow_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_underflow_sequence soc_ifc_env_mbox_dlen_underflow_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_underflow_small_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_underflow_small_sequence soc_ifc_env_mbox_dlen_underflow_small_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_underflow_medium_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_underflow_medium_sequence soc_ifc_env_mbox_dlen_underflow_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_dlen_underflow_large_sequence.svh"
  typedef soc_ifc_env_mbox_dlen_underflow_large_sequence soc_ifc_env_mbox_dlen_underflow_large_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_sram_double_bit_flip_sequence.svh"
  typedef soc_ifc_env_mbox_sram_double_bit_flip_sequence soc_ifc_env_mbox_sram_double_bit_flip_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_sram_double_bit_flip_small_sequence.svh"
  typedef soc_ifc_env_mbox_sram_double_bit_flip_small_sequence soc_ifc_env_mbox_sram_double_bit_flip_small_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_sram_double_bit_flip_medium_sequence.svh"
  typedef soc_ifc_env_mbox_sram_double_bit_flip_medium_sequence soc_ifc_env_mbox_sram_double_bit_flip_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_sram_double_bit_flip_large_sequence.svh"
  typedef soc_ifc_env_mbox_sram_double_bit_flip_large_sequence soc_ifc_env_mbox_sram_double_bit_flip_large_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rand_multi_agent_sequence.svh"
  typedef soc_ifc_env_mbox_rand_multi_agent_sequence soc_ifc_env_mbox_rand_multi_agent_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rst_sequence.svh"
  typedef soc_ifc_env_mbox_rst_sequence soc_ifc_env_mbox_rst_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rst_warm_rand_medium_sequence.svh"
  typedef soc_ifc_env_mbox_rst_warm_rand_medium_sequence soc_ifc_env_mbox_rst_warm_rand_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_rst_cold_rand_medium_sequence.svh"
  typedef soc_ifc_env_mbox_rst_cold_rand_medium_sequence soc_ifc_env_mbox_rst_cold_rand_medium_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_uc_reg_access_sequence.svh"
  typedef soc_ifc_env_mbox_uc_reg_access_sequence soc_ifc_env_mbox_uc_reg_access_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_mbox_sha_accel_sequence.svh"
  typedef  soc_ifc_env_mbox_sha_accel_sequence soc_ifc_env_mbox_sha_accel_sequence_t;
  `include "sequences/sha_accel/soc_ifc_env_sha_accel_sequence.svh"
  typedef soc_ifc_env_sha_accel_sequence soc_ifc_env_sha_accel_sequence_t;
  `include "sequences/trng/soc_ifc/soc_ifc_env_trng_write_data_sequence.svh"
  typedef soc_ifc_env_trng_write_data_sequence soc_ifc_env_trng_write_data_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_soc_mbox_handler_sequence.svh"
  typedef soc_ifc_env_soc_mbox_handler_sequence soc_ifc_env_soc_mbox_handler_sequence_t;
  `include "sequences/mbox/soc_ifc/soc_ifc_env_soc_mbox_reg_axs_invalid_handler_sequence.svh"
  typedef soc_ifc_env_soc_mbox_reg_axs_invalid_handler_sequence soc_ifc_env_soc_mbox_reg_axs_invalid_handler_sequence_t;
  `include "sequences/wdt/cptra/soc_ifc_env_wdt_sequence_base.svh"
  typedef soc_ifc_env_wdt_sequence_base soc_ifc_env_wdt_sequence_base_t;
  `include "sequences/wdt/cptra/soc_ifc_env_cptra_wdt_independent_sequence.svh"
  typedef soc_ifc_env_cptra_wdt_independent_sequence soc_ifc_env_cptra_wdt_independent_sequence_t;
  `include "sequences/wdt/cptra/soc_ifc_env_cptra_wdt_cascade_sequence.svh"
  typedef soc_ifc_env_cptra_wdt_cascade_sequence soc_ifc_env_cptra_wdt_cascade_sequence_t;

  ///////////////////// Sequences usable from soc_ifc bench only /////////////////////
  // These sequences include stimulus for the internal/caliptra-side of the
  // soc_ifc, which is done by the uC in caliptra_top bench
  /* TODO: If desired in top-level rand sequence, add this to the rand_seq_idx enum/avail_env_seqs_c constraint */
  `include "sequences/bringup/cptra/soc_ifc_env_cptra_rst_wait_sequence.svh"
  typedef soc_ifc_env_cptra_rst_wait_sequence soc_ifc_env_cptra_rst_wait_sequence_t;
  `include "sequences/bringup/cptra/soc_ifc_env_cptra_init_interrupts_sequence.svh"
  typedef soc_ifc_env_cptra_init_interrupts_sequence soc_ifc_env_cptra_init_interrupts_sequence_t;
  `include "sequences/bringup/soc_ifc_env_top_reset_warm_sequence.svh"
  typedef soc_ifc_env_top_reset_warm_sequence soc_ifc_env_top_reset_warm_sequence_t;
  `include "sequences/bringup/soc_ifc_env_top_reset_cold_sequence.svh"
  typedef soc_ifc_env_top_reset_cold_sequence soc_ifc_env_top_reset_cold_sequence_t;
  `include "sequences/mbox/cptra/soc_ifc_env_cptra_mbox_handler_sequence.svh"
  typedef soc_ifc_env_cptra_mbox_handler_sequence soc_ifc_env_cptra_mbox_handler_sequence_t;
  `include "sequences/mbox/cptra/soc_ifc_env_cptra_mbox_interference_handler_sequence.svh"
  typedef soc_ifc_env_cptra_mbox_interference_handler_sequence soc_ifc_env_cptra_mbox_interference_handler_sequence_t;
  `include "sequences/mbox/cptra/soc_ifc_env_cptra_mbox_dlen_overread_handler_sequence.svh"
  typedef soc_ifc_env_cptra_mbox_dlen_overread_handler_sequence soc_ifc_env_cptra_mbox_dlen_overread_handler_sequence_t;
  `include "sequences/mbox/cptra/soc_ifc_env_cptra_mbox_dlen_underread_handler_sequence.svh"
  typedef soc_ifc_env_cptra_mbox_dlen_underread_handler_sequence soc_ifc_env_cptra_mbox_dlen_underread_handler_sequence_t;
  `include "sequences/mbox/cptra/soc_ifc_env_cptra_mbox_req_sequence_base.svh"
  typedef soc_ifc_env_cptra_mbox_req_sequence_base soc_ifc_env_cptra_mbox_req_sequence_base_t;
  `include "sequences/mbox/cptra/soc_ifc_env_cptra_mbox_req_rand_small_sequence.svh"
  typedef soc_ifc_env_cptra_mbox_req_rand_small_sequence soc_ifc_env_cptra_mbox_req_rand_small_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_sequence_base.svh"
  typedef soc_ifc_env_top_mbox_sequence_base soc_ifc_env_top_mbox_sequence_base_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_min_sequence.svh"
  typedef soc_ifc_env_top_mbox_min_sequence soc_ifc_env_top_mbox_min_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_max_sequence.svh"
  typedef soc_ifc_env_top_mbox_max_sequence soc_ifc_env_top_mbox_max_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_small_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_small_sequence soc_ifc_env_top_mbox_rand_small_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_medium_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_medium_sequence soc_ifc_env_top_mbox_rand_medium_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_large_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_large_sequence soc_ifc_env_top_mbox_rand_large_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_small_unlock_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_small_unlock_sequence soc_ifc_env_top_mbox_rand_small_unlock_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_medium_unlock_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_medium_unlock_sequence soc_ifc_env_top_mbox_rand_medium_unlock_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_large_unlock_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_large_unlock_sequence soc_ifc_env_top_mbox_rand_large_unlock_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_contention_sequence.svh"
  typedef soc_ifc_env_top_mbox_contention_sequence soc_ifc_env_top_mbox_contention_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_axi_user_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_axi_user_sequence soc_ifc_env_top_mbox_rand_axi_user_sequence_t;
  `include "sequences/trng/cptra/soc_ifc_env_cptra_trng_data_req_sequence.svh"
  typedef soc_ifc_env_cptra_trng_data_req_sequence soc_ifc_env_cptra_trng_data_req_sequence_t;
  `include "sequences/trng/soc_ifc_env_top_trng_sequence.svh"
  typedef soc_ifc_env_top_trng_sequence soc_ifc_env_top_trng_sequence_t;
  `include "sequences/trng/soc_ifc_env_top_trng_reset_sequence.svh"
  typedef soc_ifc_env_top_trng_reset_sequence soc_ifc_env_top_trng_reset_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_axi_user_small_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_axi_user_small_sequence soc_ifc_env_top_mbox_rand_axi_user_small_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_axi_user_medium_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_axi_user_medium_sequence soc_ifc_env_top_mbox_rand_axi_user_medium_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_axi_user_large_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_axi_user_large_sequence soc_ifc_env_top_mbox_rand_axi_user_large_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_axi_user_small_unlock_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_axi_user_small_unlock_sequence soc_ifc_env_top_mbox_rand_axi_user_small_unlock_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_axi_user_medium_unlock_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_axi_user_medium_unlock_sequence soc_ifc_env_top_mbox_rand_axi_user_medium_unlock_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_axi_user_large_unlock_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_axi_user_large_unlock_sequence soc_ifc_env_top_mbox_rand_axi_user_large_unlock_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_delay_small_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_delay_small_sequence soc_ifc_env_top_mbox_rand_delay_small_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_delay_medium_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_delay_medium_sequence soc_ifc_env_top_mbox_rand_delay_medium_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rand_delay_large_sequence.svh"
  typedef soc_ifc_env_top_mbox_rand_delay_large_sequence soc_ifc_env_top_mbox_rand_delay_large_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_reg_axs_invalid_small_sequence.svh"
  typedef soc_ifc_env_top_mbox_reg_axs_invalid_small_sequence soc_ifc_env_top_mbox_reg_axs_invalid_small_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_reg_axs_invalid_medium_sequence.svh"
  typedef soc_ifc_env_top_mbox_reg_axs_invalid_medium_sequence soc_ifc_env_top_mbox_reg_axs_invalid_medium_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_reg_axs_invalid_large_sequence.svh"
  typedef soc_ifc_env_top_mbox_reg_axs_invalid_large_sequence soc_ifc_env_top_mbox_reg_axs_invalid_large_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_multi_agent_sequence.svh"
  typedef soc_ifc_env_top_mbox_multi_agent_sequence soc_ifc_env_top_mbox_multi_agent_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_dlen_violation_sequence.svh"
  typedef soc_ifc_env_top_mbox_dlen_violation_sequence soc_ifc_env_top_mbox_dlen_violation_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rst_sequence.svh"
  typedef soc_ifc_env_top_mbox_rst_sequence soc_ifc_env_top_mbox_rst_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rst_warm_rand_medium_sequence.svh"
  typedef soc_ifc_env_top_mbox_rst_warm_rand_medium_sequence soc_ifc_env_top_mbox_rst_warm_rand_medium_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_mbox_rst_cold_rand_medium_sequence.svh"
  typedef soc_ifc_env_top_mbox_rst_cold_rand_medium_sequence soc_ifc_env_top_mbox_rst_cold_rand_medium_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_cptra_mbox_sequence_base.svh"
  typedef soc_ifc_env_top_cptra_mbox_sequence_base soc_ifc_env_top_cptra_mbox_sequence_base_t;
  `include "sequences/mbox/soc_ifc_env_top_cptra_mbox_rand_small_sequence.svh"
  typedef soc_ifc_env_top_cptra_mbox_rand_small_sequence soc_ifc_env_top_cptra_mbox_rand_small_sequence_t;
  `include "sequences/mbox/soc_ifc_env_top_cptra_mbox_reg_axs_invalid_small_sequence.svh"
  typedef soc_ifc_env_top_cptra_mbox_reg_axs_invalid_small_sequence soc_ifc_env_top_cptra_mbox_reg_axs_invalid_small_sequence_t;

  // pragma uvmf custom package_item_additional end
endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

